import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:MobileGKI/utils/theme/constrains/c_textfield.dart';
import 'package:MobileGKI/utils/theme/constrains/sizes.dart';
import 'package:flutter/material.dart';

class LoginUI extends StatefulWidget {
  @override
  LoginAdmin createState() => LoginAdmin();
}

class LoginAdmin extends State<LoginUI> {
  late TextEditingController? username, password;
  late bool _passwordVisible;
  @override
  void initState() {
    super.initState();
    username = TextEditingController();
    password = TextEditingController();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    final dark = FilemonHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(FilemonSized.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: FilemonHelperFunctions.screenHeight() * 0.15),
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
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
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
                        onPressed: () {},
                        child: Text("Masuk"),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
