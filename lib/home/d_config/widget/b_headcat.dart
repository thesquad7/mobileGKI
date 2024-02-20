import 'package:flutter/material.dart';

class FilemonCatHeading extends StatelessWidget {
  const FilemonCatHeading({
    super.key,
    this.TextColor,
    this.showActionButton = true,
    required this.title,
    this.buttonTitle = 'Tampilkan semua',
    this.onPressed,
  });
  final Color? TextColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: TextColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(onPressed: () {}, child: Text(buttonTitle))
      ],
    );
  }
}
