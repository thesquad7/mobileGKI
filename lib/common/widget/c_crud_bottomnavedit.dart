import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';

class FCRUDNavigationEdit extends StatelessWidget {
  final VoidCallback edit, delete;
  const FCRUDNavigationEdit({
    super.key,
    required this.edit,
    required this.delete,
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
                child: ElevatedButton(onPressed: edit, child: Text("Update"))),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Container(
                width: FilemonHelperFunctions.screenWidth() * 0.4,
                child: ElevatedButton(onPressed: delete, child: Text("Hapus"))),
          ),
        ]),
      ),
    );
  }
}
