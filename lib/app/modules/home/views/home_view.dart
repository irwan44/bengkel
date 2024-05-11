import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:customer_bengkelly/app/componen/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Navigation Example"),
      ),
      body: Center(
        child: Text('Selected Index: $_selectedIndex'),
      ),
      bottomNavigationBar: BottomAppBar(
        color: MyColors.appPrimaryColor,
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(icon: SvgPicture.asset('assets/icons/octicon_home-16.svg'), onPressed: () => _onItemTapped(0)),
            IconButton(icon: SvgPicture.asset('assets/icons/mingcute_news-line.svg'), onPressed: () => _onItemTapped(1)),
            SizedBox(width: 48),  // Spacer for the floating action button
            IconButton(icon: SvgPicture.asset('assets/icons/icon-park-outline_history-query.svg'), onPressed: () => _onItemTapped(3)),
            IconButton(icon: SvgPicture.asset('assets/icons/gridicons_user.svg'), onPressed: () => _onItemTapped(4)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColors.redEmergencyMenu,
        onPressed: () => _onItemTapped(2),
        child: SvgPicture.asset('assets/icons/booking.svg'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}