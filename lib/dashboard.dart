import 'package:flutter/material.dart';
import 'navbar/beranda.dart';
import 'navbar/maps.dart';
import 'navbar/pesan.dart';
import 'navbar/event.dart';
import 'navbar/profile.dart';
import 'colors.dart';
import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';

class HalamanDashboard extends StatefulWidget {
  @override
  _HalamanDashboardState createState() => _HalamanDashboardState();
}

class _HalamanDashboardState extends State<HalamanDashboard> {

  @override
  Widget build(BuildContext context) {
    return FloatingNavBar(
        resizeToAvoidBottomInset: false,
        color: Color(0xFF313131),
        selectedIconColor: primaryColor,
        unselectedIconColor: Colors.white.withOpacity(0.6),
        items: [
          FloatingNavBarItem(iconData: Icons.home, page: HomePage(), title: 'Beranda'),
          FloatingNavBarItem(iconData: Icons.location_on_rounded, page: MapsPage(), title: 'Maps'),
          FloatingNavBarItem(iconData: Icons.mail_rounded, page: PesanPage(), title: 'Pesan'),
          FloatingNavBarItem(iconData: Icons.local_fire_department_rounded, page: EventPage(), title: 'Event'),
          FloatingNavBarItem(iconData: Icons.account_circle_rounded, page: ProfilePage(), title: 'Profile'),
        ],
        horizontalPadding: 10.0,
        hapticFeedback: true,
        showTitle: true,
      );
  }
}
