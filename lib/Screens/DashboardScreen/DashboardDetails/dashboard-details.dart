import 'package:finalyearproject/PublicHelpService/AirQualityIndex/aqi.dart';
import 'package:finalyearproject/PublicHelpService/Weather/weather.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// IMPORTING GOOGLE FONTS
import 'package:google_fonts/google_fonts.dart';

// IMPORTING GIF VIEW
import 'package:gif_view/gif_view.dart';

// IMPORTING SUBMIT ELECTRICITY COMPLAINTS
import 'package:finalyearproject/PublicHelpService/Complaints/submit-electricity-complaints.dart';

// IMPORTING SUBMIT POLLUTION COMPLAINTS
import 'package:finalyearproject/PublicHelpService/Complaints/submit-pollution-complaints.dart';

// IMPORTING SUBMIT SEWAGE COMPLAINTS
import 'package:finalyearproject/PublicHelpService/Complaints/submit-sewage-complaints.dart';

class DashboardDetails extends StatefulWidget {
  @override
  _DashboardDetailsState createState() => _DashboardDetailsState();
}

class _DashboardDetailsState extends State<DashboardDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        "Public Help Service",
                        style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold, fontSize: 25, color: Color(0xff3a3a36),),
                      ),
                    )
                  ],
                ),
              ],
            ),

            Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              height: 300.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SizedBox(width: 15,),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SubmitElectricityComplaints()));
                    },
                    child: Column(
                      children: [
                        Image.asset("assets/ElectricityComplaints/electricity-complaints-card-bg.png", width: 250,),
                        SizedBox(height: 20,),
                        Text(
                          'Electricity Complaints',
                          style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xff3a3a36),),
                        )
                      ],
                    )
                  ),
                  SizedBox(width: 10,),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SubmitPollutionComplaints()));
                      },
                      child: Column(
                        children: [
                          Image.asset("assets/PollutionComplaints/pollution-card-bg.png", width: 250,),
                          SizedBox(height: 20,),
                          Text(
                            'Pollution Complaints',
                            style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xff3a3a36),),
                          )
                        ],
                      )
                  ),
                  SizedBox(width: 10,),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SubmitSewageComplaints()));
                      },
                      child: Column(
                        children: [
                          Image.asset("assets/SewageComplaints/sewage-card-bg.png", width: 250,),
                          SizedBox(height: 20,),
                          Text(
                            'Sewage Complaints',
                            style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xff3a3a36),),
                          )
                        ],
                      )
                  ),
                  // SizedBox(width: 10,),
                  // GestureDetector(
                  //     onTap: () {
                  //       // Navigator.of(context).push(MaterialPageRoute(builder: (context) => DataTypesScreen()));
                  //     },
                  //     child: Column(
                  //       children: [
                  //         Image.asset("assets/blood-donor.png", width: 250,),
                  //         SizedBox(height: 20,),
                  //         Text(
                  //           'Blood Donor',
                  //           style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xff3a3a36),),
                  //         )
                  //       ],
                  //     )
                  // ),
                  // SizedBox(width: 10,),
                  // GestureDetector(
                  //     onTap: () {
                  //       // Navigator.of(context).push(MaterialPageRoute(builder: (context) => DataTypesScreen()));
                  //     },
                  //     child: Column(
                  //       children: [
                  //         Image.asset("assets/WomenSafety/women-safety-card-bg.png", width: 250,),
                  //         SizedBox(height: 20,),
                  //         Text(
                  //           'Women Safety',
                  //           style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xff3a3a36),),
                  //         )
                  //       ],
                  //     )
                  // ),
                  SizedBox(width: 15,),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              height: 300.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SizedBox(width: 15,),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AirQualityIndex()));
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/aqi.png', width: 250,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(height: 20,),
                          Text(
                            'Air Quality Index',
                            style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xff3a3a36),),
                          )
                        ],
                      )
                  ),
                  SizedBox(width: 10,),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => WeatherStats()));
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/weather.png', width: 250,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(height: 20,),
                          Text(
                            'Weather',
                            style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xff3a3a36),),
                          )
                        ],
                      )
                  ),
                  SizedBox(width: 15,),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
