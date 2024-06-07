import 'package:flutter/material.dart';
import 'package:practice_work/theme/colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.darkblue,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            padding: EdgeInsets.all(40),
            child: Text(
              'SAPDOS',
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                fontFamily: AutofillHints.telephoneNumberNational,
                fontSize: 44,
              ),
            ),
          ),
          _buildDrawerListTile(
              context, Icons.dashboard_customize_outlined, 'Categories', () {}),
          _buildDrawerListTile(
              context, Icons.calendar_today_outlined, 'Appointment', () {}),
          _buildDrawerListTile(context, Icons.chat_bubble, 'Chat', () {}),
          _buildDrawerListTile(context, Icons.settings, 'Settings', () {}),
          _buildDrawerListTile(context, Icons.logout, 'Logout', () {}),
        ],
      ),
    );
  }

  ListTile _buildDrawerListTile(
      BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: AppColors.white),
      title: Text(
        title,
        style: const TextStyle(color: AppColors.white, fontSize: 20),
      ),
      onTap: onTap,
    );
  }
}
