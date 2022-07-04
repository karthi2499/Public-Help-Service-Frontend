import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class Weather_Display extends StatelessWidget {
  Weather_Display({
    Key? key,
    required this.backgroundImage,
    required this.weatherDisplayIcon,
    required this.temperature,
    required this.locationName,
    required this.countryName,
    required this.weatherDesc,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
    required this.windSpeed,
  }) 
  
  : super(key: key);
  final AssetImage backgroundImage;
  final Icon weatherDisplayIcon;
  final int temperature;
  final String locationName;
  final String countryName;
  final String weatherDesc;
  final int tempMin;
  final int tempMax;
  final int humidity;
  final int windSpeed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: backgroundImage,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 85,
            ),
            Container(
              child: weatherDisplayIcon,
            ),
            SizedBox(
              height: 15.0,
            ),
            Center(
              child: Text(
                ' $temperature°',
                style: GoogleFonts.ubuntu(color: Color(0xff3a3a36), fontWeight: FontWeight.bold, fontSize: 80),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Center(
              child: Text(
                '$locationName, $countryName',
                style: GoogleFonts.ubuntu(color: Color(0xff3a3a36), fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                '$weatherDesc'.toUpperCase(),
                style: GoogleFonts.ubuntu(color: Color(0xff3a3a36), fontWeight: FontWeight.bold, fontSize: 40),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "MIN: $tempMin° MAX: $tempMax",
                style: GoogleFonts.ubuntu(color: Color(0xff3a3a36), fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Center(
              child: Text(
                "Humidity: $humidity%".toUpperCase(),
                style: GoogleFonts.ubuntu(color: Color(0xff3a3a36), fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "Wind Speed: $windSpeed MPH".toUpperCase(),
                style: GoogleFonts.ubuntu(color: Color(0xff3a3a36), fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}