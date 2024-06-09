import 'package:MobileGKI/data/api_config.dart';
import 'package:MobileGKI/init/onboardingscreen.dart';
import 'package:MobileGKI/provider/InitialProvider/loginProvider.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:MobileGKI/utils/theme/constrains/c_textfield.dart';
import 'package:MobileGKI/utils/theme/constrains/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginUI extends StatefulWidget {
  @override
  LoginAdmin createState() => LoginAdmin();
}

class LoginAdmin extends State<LoginUI> {
  late TextEditingController? username, password;
  late bool _passwordVisible;
  final deviceStorage = GetStorage();

  final LoginProvider loginStateProvider = Get.put(LoginProvider());
  @override
  void initState() {
    super.initState();
    username = TextEditingController();
    password = TextEditingController();
    _passwordVisible = true;
    loginStateProvider.enableButton.value = true;
    loginStateProvider.loadingState.value = false;
    loginStateProvider.info.value = "";
  }

  @override
  Widget build(BuildContext context) {
    final dark = FilemonHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(FilemonSized.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: FilemonSized.appBarHeight * 0.4),
                IconButton(
                    onPressed: () {
                      deviceStorage.write('isFirstTime', true);
                      Get.offAll(() => OnboardingScreen());
                    },
                    icon: Icon(Icons.arrow_back)),
                SizedBox(height: FilemonHelperFunctions.screenHeight() * 0.1),
                Card(
                  child: Container(
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/logo.png"),
                    ),
                  ),
                ),
                Text(
                  "Hi! Admin",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Silahkan masukkan identitas anda",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                SizedBox(
                  height: 20,
                ),
                FTextField(
                  title: "Username",
                  prefix: Icon(Icons.person),
                  controller: username,
                ),
                SizedBox(
                  height: 20,
                ),
                FTextField(
                  controller: password,
                  title: "Kata Sandi",
                  prefix: Icon(Icons.security),
                  suffix: IconButton(
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: dark ? Colors.white : Colors.black,
                    ),
                  ),
                  passtext: _passwordVisible,
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: FilemonHelperFunctions.screenWidth(),
                  child: Center(
                    child: Container(
                        width: FilemonHelperFunctions.screenWidth() * 0.5,
                        child: ElevatedButton(
                          onPressed: loginStateProvider.enableButton.value
                              ? () async {
                                  if (username!.text == "" &&
                                      username!.text == "") {
                                    return FilemonHelperFunctions.showSnackBar(
                                        "Harap Isi Usernama & Password");
                                  }
                                  if (username!.text == "") {
                                    return FilemonHelperFunctions.showSnackBar(
                                        "Harap Isi Username");
                                  }
                                  if (password!.text == "") {
                                    return FilemonHelperFunctions.showSnackBar(
                                        "Harap Isi Password");
                                  }
                                  deviceStorage.write('user_login', true);
                                  setState(() {
                                    loginStateProvider.setLoadingstate(true);
                                  });
                                  await APILogin(
                                          userCred: username!.text,
                                          userCredPw: password!.text)
                                      .requestLogin();
                                  // setState(() {});
                                }
                              : null,
                          child: LoginCondition(),
                        )),
                  ),
                ),
                Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    loginStateProvider.info.value,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget LoginCondition() {
    if (loginStateProvider.loadingState.value == false) {
      return Text("Masuk");
    } else {
      return CircularProgressIndicator();
    }
  }
}
