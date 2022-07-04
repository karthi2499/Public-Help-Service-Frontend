import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class StateVaccineStatsPage extends StatefulWidget {
  @override
  _StateVaccineStatsPageState createState() => _StateVaccineStatsPageState();
}

class _StateVaccineStatsPageState extends State<StateVaccineStatsPage> {

  List? stateData = null;
  fetchCountryData()async{
    http.Response response = await http.get(Uri.parse('https://india-covid19vaccine.github.io/api/state_latest.json'));
    setState(() {
      stateData = jsonDecode(response.body);
    });
  }

  @override
  void initState(){
    fetchCountryData();
    super.initState();
  }

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
          "Regional Stats",
          style: GoogleFonts.ubuntu(color: Color(0xff3a3a36), fontWeight: FontWeight.bold),
        ),
      ),
      body: stateData == null
      ? Center(child: CircularProgressIndicator(),)
      : ListView.builder(
        itemCount: stateData!.length - 1,
        itemBuilder: (context, index){
          return Container(
            margin: EdgeInsets.all(10),
            height: 152,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xfff5f5f5),
                  blurRadius: 10,
                  offset: Offset(0,10)
                )
              ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    stateData![index]['state'],
                    style: GoogleFonts.ubuntu(color: Color(0xff3a3a36), fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                StateVaccinationDataPanel(title: "Total Doses", count: stateData![index]['total_doses'].toString(), textColor: Color(0xffe896b1)),
                StateVaccinationDataPanel(title: "Partially Vaccinated", count: stateData![index]['total_vaccinated'].toString(), textColor: Color(0xff007bff)),
                StateVaccinationDataPanel(title: "Fully Vaccinated", count: stateData![index]['total_fully_vaccinated'].toString(), textColor: Color(0xff28a745)),
                StateVaccinationDataPanel(title: "Population", count: stateData![index]['population'].toString(), textColor: Color(0xff6c757d)),
              ],
            ),
          );
        }
      ),
    );
  }
}

class StateVaccinationDataPanel extends StatelessWidget {
  final String title;
  final String count;
  final Color? textColor;

  const StateVaccinationDataPanel({Key? key, required this.title, required this.count, required this.textColor}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Text(
        "$title: $count",
        style: GoogleFonts.ubuntu(
            color: textColor, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}