import 'package:MobileGKI/common/widget/c_rondedimg.dart';
import 'package:MobileGKI/utils/constrains/image_string.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';

class EditPhotoJemaat extends StatelessWidget {
  const EditPhotoJemaat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = FilemonHelperFunctions.isDarkMode(context);

    return Positioned(
      top: 150,
      child: SizedBox(
        height: 120,
        child: Stack(clipBehavior: Clip.none, children: [
          RoundedIMG(
            height: 100,
            imageUrl: Filemonimages.pendeta1,
          ),
          Positioned(
            bottom: 10,
            right: -5,
            child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    color: dark ? Colors.white : Colors.black,
                    borderRadius: BorderRadius.circular(100)),
                child: IconButton(
                    color: dark ? Colors.black : Colors.white,
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit,
                      size: 15,
                    ))),
          )
        ]),
      ),
    );
  }
}
