import 'package:flutter/material.dart';

class ThemeWidget extends StatelessWidget {
  const ThemeWidget({
    super.key,
    required this.address,
  });
  final String address;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.manage_accounts_rounded),
          SizedBox(width: 10),
          Container(
              width: 280,
              child: Text(
                address,
                style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.visible,
              ))
        ],
      ),
    );
  }
}
