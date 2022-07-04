import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CountryWidePanel extends StatelessWidget {
  final Map? countryData;

  const CountryWidePanel({Key? key, required this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2
        ),
        children: [
          StatusPanel(
            panelColor: Color(0xfffff6f5),
            textColor: Color(0xffff073a),
            title: "Confirmed",
            count: countryData!['data']['summary']['confirmedCasesIndian'].toString(),
          ),
          StatusPanel(
            panelColor: Color(0xfff7f8ff),
            textColor: Color(0xff007bff),
            title: "Active",
            count: countryData!['data']['unofficial-summary'][0]['active'].toString(),
          ),
          StatusPanel(
            panelColor: Color(0xffeefeed),
            textColor: Color(0xff28a745),
            title: "Recovered",
            count: countryData!['data']['summary']['discharged'].toString(),
          ),
          StatusPanel(
            panelColor: Color(0xfff5f5f5),
            textColor: Color(0xff6c757d),
            title: "Deceased",
            count: countryData!['data']['summary']['deaths'].toString(),
          ),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color? panelColor;
  final Color? textColor;
  final String title;
  final String count;

  const StatusPanel({Key? key, required this.panelColor, required this.textColor, required this.title, required this.count}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.all(5),
      color: panelColor,
      width: MediaQuery.of(context).size.width/2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: GoogleFonts.ubuntu(
                color: textColor, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 10,),
          Text(
            count,
            style: GoogleFonts.ubuntu(
                color: textColor, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}