import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;


class StateStatisticsPage extends StatefulWidget {
  @override
  _StateStatisticsPageState createState() => _StateStatisticsPageState();
}

class _StateStatisticsPageState extends State<StateStatisticsPage> {

  Map? countryData = null;
  List? stateData = null;
  fetchCountryData()async{
    http.Response response = await http.get(Uri.parse('https://api.rootnet.in/covid19-in/stats/latest'));
    setState(() {
      countryData = jsonDecode(response.body);
      stateData = countryData!['data']['regional'];
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
        itemCount: stateData!.length,
        itemBuilder: (context, index){
          return Container(
            margin: EdgeInsets.all(10),
            height: 150,
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
                    stateData![index]['loc'],
                    style: GoogleFonts.ubuntu(color: Color(0xff3a3a36), fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                StateStatisticsDataPanel(title: "Confirmed", count: stateData![index]['confirmedCasesIndian'].toString(), textColor: Color(0xffff073a)),
                StateStatisticsDataPanel(title: "Recovered", count: stateData![index]['discharged'].toString(), textColor: Color(0xff28a745)),
                StateStatisticsDataPanel(title: "Deceased", count: stateData![index]['deaths'].toString(), textColor: Color(0xff6c757d)),
              ],
            ),
          );
        }
      ),
    );
  }
}

class StateStatisticsDataPanel extends StatelessWidget {
  final String title;
  final String count;
  final Color? textColor;

  const StateStatisticsDataPanel({Key? key, required this.title, required this.count, required this.textColor}) : super(key: key);
  
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