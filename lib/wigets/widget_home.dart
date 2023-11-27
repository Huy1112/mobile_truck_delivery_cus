import 'package:flutter/material.dart';
import 'package:truck_delivery_customer/wigets/subtitle.dart';

import 'card_announce_medium.dart';
import 'card_with_transparent_and_border.dart';
import 'headline.dart';
import 'navigate_button.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              itemBuilder: (context, index) =>
                  CardWithTransparentAndBorder(
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