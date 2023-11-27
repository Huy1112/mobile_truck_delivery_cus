import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../wigets/card_announce_medium.dart';
import '../wigets/card_with_transparent_and_border.dart';
import '../wigets/headline.dart';
import '../wigets/navigate_button.dart';
import '../wigets/subtitle.dart';
import '../controller/dashboard_controller.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DashboardScreen> {
  final DashboardController dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Headline(
              title: "Dashboard",
              caption: "Un bref aperçu de l'etat du systeme",
            ),
            const SizedBox(height: 32),
            SizedBox(
              height: 214,
              child: ListView.separated(
                itemCount: 12,
                shrinkWrap: true,
                primary: false,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(width: 16),
                itemBuilder: (context, index) => const CardAnnounceMedium(
                  iconData: Icons.stars,
                  title: "La meilleure information ici!",
                  subtitle:
                  "Cette card est faite pour placer des annonces important pour le systeme.",
                ),
              ),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                const Subtitle(title: "Section"),
                const Spacer(),
                NavigateButton(
                  onTap: () {},
                  title: "Voir plus",
                  iconData: Icons.arrow_forward,
                ),
              ],
            ),
            SizedBox(
              height: 214,
              child: ListView.separated(
                itemCount: 10,
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
      ),
    ),);
  }
}