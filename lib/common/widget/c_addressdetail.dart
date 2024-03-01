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
      height: 35,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.location_on),
          SizedBox(width: 10),
          Container(
              width: 280,
              child: Text(
                address,
                overflow: TextOverflow.visible,
              ))
        ],
      ),
    );
  }
}
