import 'package:flutter/material.dart';

import '../constant/app_colors.dart';

class CardWithTransparentAndBorder extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;

  const CardWithTransparentAndBorder({
    Key? key,
    required this.title,
    required this.description,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final secondaryColor = Theme.of(context).colorScheme.primary;
    final borderRadius = BorderRadius.circular(8);

    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: borderRadius,
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Đã hoàn tất - 26 Thg 10"),
            const SizedBox(height: 12),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.my_location,
                      size: 18,
                      color: AppColors.primary,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Text(
                            'Phạm Huy ',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Text('- 22 đường 15', style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 2),
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_downward,
                        size: 15,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 18,
                      color: AppColors.blueAccent,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Text(
                            'Pham Huy ',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Text('- 22 duong 15', style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 3),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "Xem chi tiết",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.bold, color: secondaryColor),
                ),
                const SizedBox(width: 3),
                Icon(
                  Icons.arrow_forward,
                  size: 18,
                  color: secondaryColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
