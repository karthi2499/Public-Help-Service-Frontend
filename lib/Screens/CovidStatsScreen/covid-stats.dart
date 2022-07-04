import 'dart:convert';
import 'package:finalyearproject/Screens/CovidStatsScreen/pages/state-statistics-page.dart';
import 'package:finalyearproject/Screens/CovidStatsScreen/pages/state-vaccine-stats-page.dart';
import 'package:finalyearproject/Screens/CovidStatsScreen/panels/country-wide-panel.dart';
import 'package:finalyearproject/Screens/CovidStatsScreen/panels/country-wide-vaccination-panel.dart';
import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class CovidStats extends StatefulWidget {
  @override
  _CovidStatsState createState() => _CovidStatsState();
}

class _CovidStatsState extends State<CovidStats> {

  Map? countryData = null;
  List? countryVaccinationData = null;
  fetchCountryData()async{
    http.Response response = await http.get(Uri.parse('https://api.rootnet.in/covid19-in/stats/latest'));
    setState(() {
      countryData = jsonDecode(response.body);
    });
  }

  fetchCountryVaccinationData()async{
    http.Response response = await http.get(Uri.parse('https://india-covid19vaccine.github.io/api/national_latest.json'));
    setState(() {
      countryVaccinationData = jsonDecode(response.body);
    });
  }

  @override
  void initState(){
    fetchCountryData();
    fetchCountryVaccinationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(
                children: [
                  GifView.asset(
                    'assets/GIF/wear-mask.gif',
                    fit: BoxFit.fill,
                  ),
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              margin: EdgeInsets.all(10),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "India",
                    style: GoogleFonts.ubuntu(
                        color: Color(0xff3a3a36), fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          side: BorderSide(
                          color: Color(0xff3a3a36),
                        )
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => StateStatisticsPage()));
                      },
                      child: Text(
                        "Regional",
                        style: GoogleFonts.ubuntu(
                            color: Color(0xff3a3a36), fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                  ),
                ],
              ),
            ),
            countryData == null
            ? Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width/3,
              child: CircularProgressIndicator(
                color: Color(0xff3a3a36),
              ),
            )
            : CountryWidePanel(countryData: countryData,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Vaccination",
                    style: GoogleFonts.ubuntu(
                        color: Color(0xff3a3a36), fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        side: BorderSide(
                          color: Color(0xff3a3a36),
                        )
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => StateVaccineStatsPage()));
                    },
                    child: Text(
                      "Regional",
                      style: GoogleFonts.ubuntu(
                          color: Color(0xff3a3a36), fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            countryVaccinationData == null
            ? Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width/3,
              child: CircularProgressIndicator(
                color: Color(0xff3a3a36),
              ),
            )
            : CountryWideVaccinationPanel(vaccinationData: countryVaccinationData,),
            SizedBox(height: 25,)
          ],
        ),
      ),
    );
  }
}