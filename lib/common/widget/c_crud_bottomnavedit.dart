import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';

class FCRUDNavigationEdit extends StatelessWidget {
  const FCRUDNavigationEdit({
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
                width: FilemonHelperFunctions.screenWidth() * 0.4,
                child: ElevatedButton(onPressed: () {}, child: Text("Update"))),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Container(
                width: FilemonHelperFunctions.screenWidth() * 0.4,
                child: ElevatedButton(onPressed: () {}, child: Text("Hapus"))),
          ),
        ]),
      ),
    );
  }
}
