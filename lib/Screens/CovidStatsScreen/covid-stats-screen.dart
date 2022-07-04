import 'package:finalyearproject/Screens/CovidStatsScreen/covid-stats.dart';
import 'package:flutter/material.dart';

// IMPORTING GOOGLE FONTS
import 'package:google_fonts/google_fonts.dart';

// IMPORTING IONICONS
import 'package:ionicons/ionicons.dart';

class CovidStatsScreen extends StatefulWidget {
  @override
  _CovidStatsScreenState createState() => _CovidStatsScreenState();
}

class _CovidStatsScreenState extends State<CovidStatsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          "Covid-19 Stats",
          style: GoogleFonts.ubuntu(
              color: Color(0xff3a3a36), fontWeight: FontWeight.bold),
        ),
      ),
      body: CovidStats(),
    );
  }
}
