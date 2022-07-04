import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// IMPORTING ION ICONS
import 'package:ionicons/ionicons.dart';

// IMPORTING GOOGLE FONTS
import 'package:google_fonts/google_fonts.dart';

// IMPORTING SALOMON BOTTOM NAVIGATION BAR
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

// IMPORTING SCREENS
import 'package:finalyearproject/Screens/exportScreens.dart';

class SalomonBottomNavigationBar extends StatefulWidget {

  @override
  _SalomonBottomNavigationBarState createState() => _SalomonBottomNavigationBarState();
}

class _SalomonBottomNavigationBarState extends State<SalomonBottomNavigationBar> {
  var _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    DashboardScreen(),
    CovidStatsScreen(),
    NewsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Public Help Service",
          home: Scaffold(
            bottomNavigationBar: Container(
              color: Colors.white,
              child: SalomonBottomBar(
                curve: Curves.linear,
                itemShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                unselectedItemColor: Color(0xffacaba1),
                currentIndex: _selectedIndex,
                onTap: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                items: [
                  /// Dashboard
                  SalomonBottomBarItem(
                    icon: Icon(Icons.dashboard_rounded),
                    title: Text("Dashboard", style: GoogleFonts.ubuntu(),),
                    selectedColor: Color(0xff3a3a36),
                  ),

                  /// Covid Stats
                  SalomonBottomBarItem(
                    icon: Icon(FontAwesomeIcons.shieldVirus),
                    title: Text("Covid-19 Stats", style: GoogleFonts.ubuntu(),),
                    selectedColor: Color(0xff3a3a36),
                  ),

                  /// News
                  SalomonBottomBarItem(
                    icon: Icon(Icons.explore),
                    title: Text("News", style: GoogleFonts.ubuntu(),),
                    selectedColor: Color(0xff3a3a36),
                  ),

                  /// Profile
                  SalomonBottomBarItem(
                    icon: Icon(Ionicons.person),
                    title: Text("Profile", style: GoogleFonts.ubuntu(),),
                    selectedColor: Color(0xff3a3a36),
                  ),
                ],
              ),
            ),
            body: _widgetOptions.elementAt(_selectedIndex),
          ),
        ),
        onWillPop: () async => false,
    );
  }
}