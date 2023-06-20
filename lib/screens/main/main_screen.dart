import 'package:admin_panel_flutter/responsive.dart';
import 'package:admin_panel_flutter/screens/components/side_menu.dart';
import 'package:admin_panel_flutter/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                  //default flex =1
                  //it takes 1/6 part of screen
                  child: SideMenu()),
            Expanded(
              flex: 5,
              child: DashboardView(),
            )
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  String title;
  String iconPath;
  VoidCallback press;

  DrawerListTile(
      {required this.title, required this.iconPath, required this.press});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      leading: SvgPicture.asset(
        iconPath,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
