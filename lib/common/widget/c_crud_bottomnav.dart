import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class FCRUDNavigation extends StatelessWidget {
  const FCRUDNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = FilemonHelperFunctions.isDarkMode(context);
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: dark ? Colors.black54 : Colors.white54,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8), topRight: Radius.circular(8))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Container(
                width: FilemonHelperFunctions.screenWidth() * 0.8,
                child: ElevatedButton(onPressed: () {}, child: Text("Simpan"))),
          ),
        ]),
      ),
    );
  }
}
