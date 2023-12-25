import 'package:flutter/material.dart';

import '../constant/app_colors.dart';

class CardWithTransparentAndBorder extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;
  final bool selected;

  const CardWithTransparentAndBorder({
    Key? key,
    this.selected = false,
    required this.title,
    required this.description,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final secondaryColor = Theme.of(context).colorScheme.primary;
    final borderRadius = BorderRadius.circular(8);

    return InkWell(
      onTap: selected ? null : onTap,
      borderRadius: borderRadius,
      child: Container(
        width: 340,
        height: 100,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: borderRadius,
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Da hoan tat - 26 Thg 10"),
            const SizedBox(height: 12),
            Column(children: [
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
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_downward,
                        size: 15,
                      ),
                    ],
                  ),
                  SizedBox(height: 8,),

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
                ],),
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
                  color: selected ? secondaryColor : Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
