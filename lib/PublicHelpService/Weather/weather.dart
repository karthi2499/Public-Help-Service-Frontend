import 'package:finalyearproject/PublicHelpService/Weather/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherStats extends StatefulWidget {

  @override
  _WeatherStatsState createState() => _WeatherStatsState();
}

class _WeatherStatsState extends State<WeatherStats> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.chevron_left, color: Color(0xff3a3a36),)
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          "Weather",
          style: GoogleFonts.ubuntu(color: Color(0xff3a3a36), fontWeight: FontWeight.bold),
        ),
      ),
      body: LoadingScreen(),
    );
  }
}