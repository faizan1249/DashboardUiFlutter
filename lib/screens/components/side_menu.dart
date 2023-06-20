import 'package:admin_panel_flutter/screens/main/main_screen.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
              child: SingleChildScrollView(
    child: Column(
      children: [
        DrawerHeader(child: Image.asset('assets/icons/logo.png')),
        DrawerListTile(
          title: "Dashboard",
          iconPath: 'assets/icons/menu_dashboard.svg',
          press: () {
            print("Dashboard");
          },
        ),
        DrawerListTile(
          title: "Transaction",
          iconPath: 'assets/icons/menu_tran.svg',
          press: () {
            print("Transaction");
          },
        ),
        DrawerListTile(
          title: "Task",
          iconPath: 'assets/icons/menu_task.svg',
          press: () {
            print("Dashboard");
          },
        ),
        DrawerListTile(
          title: "Documents",
          iconPath: 'assets/icons/menu_dashboard.svg',
          press: () {
            print("Dashboard");
          },
        ),
        DrawerListTile(
          title: "Store",
          iconPath: 'assets/icons/menu_store.svg',
          press: () {
            print("Dashboard");
          },
        ),
        DrawerListTile(
          title: "Settings",
          iconPath: 'assets/icons/menu_setting.svg',
          press: () {
            print("Settings");
          },
        ),
      ],
    ),
              ),
            );
  }
}
