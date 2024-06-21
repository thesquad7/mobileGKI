import 'package:MobileGKI/utils/constrains/colors.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';

class icondataAdmin extends StatelessWidget {
  const icondataAdmin({
    super.key,
    required this.icon,
    required this.name,
  });
  final IconData icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    final dark = FilemonHelperFunctions.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.all(0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 2,
              offset: Offset(0, 3), // Shadow position
            ),
          ],
          color: dark
              ? FilemonColor.white.withOpacity(0.1)
              : FilemonColor.black.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: dark
                ? FilemonColor.white.withOpacity(0.2)
                : FilemonColor.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              icon,
              size: 70,
            ),
            Text(
              name,
              overflow: TextOverflow.ellipsis,
            )
          ]),
        ),
      ),
    );
  }
}
