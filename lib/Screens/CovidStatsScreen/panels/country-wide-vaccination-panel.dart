import 'package:flutter/material.dart';

import 'country-wide-panel.dart';

class CountryWideVaccinationPanel extends StatelessWidget {

  final List? vaccinationData;

  const CountryWideVaccinationPanel({Key? key, required this.vaccinationData}) : super(key: key);

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
            panelColor: Color(0xfffaeaef),
            textColor: Color(0xffe896b1),
            title: "Total Doses",
            count: vaccinationData![0]['total_doses'].toString()
          ),
          StatusPanel(
              panelColor: Color(0xfff7f8ff),
              textColor: Color(0xff007bff),
            title: "Vaccinated",
            count: vaccinationData![0]['total_vaccinated'].toString()
          ),
          StatusPanel(
              panelColor: Color(0xffeefeed),
              textColor: Color(0xff28a745),
            title: "Fully Vaccinated",
            count: vaccinationData![0]['total_fully_vaccinated'].toString()
          ),
          StatusPanel(
              panelColor: Color(0xfff5f5f5),
              textColor: Color(0xff6c757d),
            title: "Population",
            count: vaccinationData![0]['population'].toString()
          ),
        ],
      ),
    );
  }
}