import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truck_delivery_customer/controller/dashboard_controller.dart';
import 'package:truck_delivery_customer/wigets/navigate_button.dart';
import 'package:truck_delivery_customer/wigets/subtitle.dart';

import '../models/route.dart';
import 'card_announce_medium.dart';
import 'card_with_transparent_and_border.dart';
import 'floating_action_button.dart';
import 'headline.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<HomeWidget> {
  static const List<Widget> _widgetServiceOptions = <Widget>[
    FloatingActionButtonForm(
      iconData: Icons.local_shipping,
      label: "Giao Hàng",
      url: Routes.deliveryDetailPage,
      heroTag: 'btn1', type: 'standard',
    ),
    FloatingActionButtonForm(
      iconData: Icons.directions_car_filled,
      label: "Ôtô",
      url: '',
      heroTag: 'btn2', type:'standard',
    ),
    FloatingActionButtonForm(
      iconData: Icons.apps,
      label: "Tất cả",
      heroTag: 'btn3',
      url: '', type: 'standard',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Headline(
            title: "Xin Chào",
            caption: "Phạm Huy",
          ),
          const SizedBox(height: 32),
          SizedBox(
            height: 214,
            child: ListView.separated(
              itemCount: 3,
              shrinkWrap: true,
              primary: false,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(width: 16),
              itemBuilder: (context, index) => const CardAnnounceMedium(
                iconData: Icons.stars,
                title: "Giao Hàng Tận Nơi",
                subtitle: "Dịch vụ vẩn chuyển hàng hóa.",
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
              height: 60,
              child: ListView.builder(
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                itemCount: _widgetServiceOptions.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: _widgetServiceOptions[index],
                  );
                },
              )),
          const SizedBox(height: 12),
          Row(
            children: [
              const Subtitle(title: "Lịch sử Đơn hàng"),
              const Spacer(),
              NavigateButton(
                onTap: () {},
                title: "Xem tất cả",
                iconData: Icons.arrow_forward,
              ),
            ],
          ),
          SizedBox(
            height: 214,
            child: ListView.separated(
              itemCount: 2,
              shrinkWrap: true,
              primary: false,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(width: 16),
              itemBuilder: (context, index) => CardWithTransparentAndBorder(
                selected: index == 0,
                title: 'Une Section',
                description: 'Ceci est la description de cette section.',
                onTap: () {},
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
