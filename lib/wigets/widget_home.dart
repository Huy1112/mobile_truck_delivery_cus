import 'package:flutter/material.dart';

import '../domain/route.dart';
import 'card_announce_medium.dart';
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
    ),
    FloatingActionButtonForm(
      iconData: Icons.directions_car_filled,
      label: "Ôtô",
      url: '',
    ),
    FloatingActionButtonForm(
      iconData: Icons.apps,
      label: "Tất cả",
      url: '',
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
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

//
// Card(
// color: Colors.green,
// shadowColor: Colors.black,
// child: Column(
// mainAxisSize: MainAxisSize.min,
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: <Widget> [
// Row(
// mainAxisSize: MainAxisSize.min,
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: <Widget> [
// Icon(Icons.pending_actions),
// TextFormField(
// // controller: loginController.passwordController,
// decoration: const InputDecoration(
// filled: true,
// hintText: 'Điểm đi',
// border: InputBorder.none,
// ),
// obscureText: true,
// onChanged: (value) {
// // formData.password = value;
// },
// ),
// ],
// )
//
// // Container(
// //   padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
// //   alignment: Alignment.centerLeft,
// //   child: TextFormField(
// //     // controller: loginController.passwordController,
// //     decoration: const InputDecoration(
// //       filled: true,
// //       hintText: 'Điểm đến',
// //       border: InputBorder.none,
// //     ),
// //     obscureText: true,
// //     onChanged: (value) {
// //       // formData.password = value;
// //     },
// //   ),
// // ),
// ],
// )),