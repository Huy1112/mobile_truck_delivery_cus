import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Headline extends StatelessWidget {
  final String title;
  final String? caption;
  final double? fontSizeTitle;

  const Headline({
    Key? key,
    required this.title,
    this.caption,
    this.fontSizeTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: fontSizeTitle),
            ),
            caption != null
                ? Text(
              caption!,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 12),
            )
                : const SizedBox.shrink(),
          ],
        ),
      );
  }
}