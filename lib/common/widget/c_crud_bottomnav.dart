import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';

class FCRUDNavigation extends StatelessWidget {
  FCRUDNavigation({
    super.key,
    required this.create,
  });
  final VoidCallback create;
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
                child:
                    ElevatedButton(onPressed: create, child: Text("Simpan"))),
          ),
        ]),
      ),
    );
  }
}
