import 'package:MobileGKI/common/widget/c_appabar.dart';
import 'package:MobileGKI/utils/theme/constrains/colors.dart';
import 'package:MobileGKI/utils/theme/constrains/text.dart';
import 'package:flutter/material.dart';

class berandaAppbar extends StatelessWidget {
  const berandaAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilemonAppBar(
      title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(FilemonText.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: FilemonColor.grey)),
        Text(FilemonText.homeAppbarSubTitle,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: FilemonColor.grey))
      ]),
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.calendar_month))],
    );
  }
}
