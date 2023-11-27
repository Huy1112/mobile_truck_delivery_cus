import 'package:flutter/material.dart';

import '../constant/app_colors.dart';
import '../wigets/menu.dart';

class MobileScaffold extends StatefulWidget {
  final Widget content;
  const MobileScaffold({super.key, required this.content});

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: AppColors.background,
      drawer: (widget.content != "LoginPage") ? null : Menu(),
      body: SafeArea(
        child: Stack(
          children: [
            widget.content,
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: (widget.content != "LoginPage") ? null : IconButton(
                    onPressed: () {
                      _globalKey.currentState!.openDrawer();
                    },
                    icon: const Icon(
                      Icons.sort,
                      size: 30.0,
                      color: AppColors.indigo,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}