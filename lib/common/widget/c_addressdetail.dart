import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';

class AddressDetail extends StatelessWidget {
  const AddressDetail({
    super.key,
    required this.address,
  });
  final String address;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.location_on),
          SizedBox(width: 10),
          Container(
              width: FilemonHelperFunctions.screenWidth() * 0.8,
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
