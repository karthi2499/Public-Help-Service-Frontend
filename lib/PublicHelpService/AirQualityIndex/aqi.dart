import 'package:flutter/material.dart';
import 'package:air_quality/air_quality.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

enum AppState { NOT_DOWNLOADED, DOWNLOADING, FINISHED_DOWNLOADING }

class AirQualityIndex extends StatefulWidget {

  @override
  _AirQualityIndexState createState() => _AirQualityIndexState();
}

class _AirQualityIndexState extends State<AirQualityIndex> {
  String _key = '4fa77a29668b6c8ac4b740556749ff058d77f83d';
  late AirQuality _airQuality;
  AppState _state = AppState.NOT_DOWNLOADED;
  late List<AirQualityData> _data;

  @override
  void initState() {
    super.initState();
    _airQuality = new AirQuality(_key);
  }

  Future download() async {
    _data = [];

    setState(() {
      _state = AppState.DOWNLOADING;
    });

    /// Via IP (depends on service provider)
    AirQualityData fromIP = await _airQuality.feedFromIP();

    // Update screen state
    setState(() {
      _data.add(fromIP);
    });

    setState(() {
      _state = AppState.FINISHED_DOWNLOADING;
    });
  }

  Widget contentFinishedDownload() {
    return Center(
      child: ListView.separated(
        itemCount: _data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              _data[index].toString(),
              style: GoogleFonts.ubuntu(color: Color(0xff3a3a36), fontWeight: FontWeight.bold,fontSize: 16),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }

  Widget contentDownloading() {
    return Container(
        margin: EdgeInsets.all(25),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Text(
            'Fetching Air Quality Index...',
            style: GoogleFonts.ubuntu(color: Color(0xff3a3a36), fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Container(
              margin: EdgeInsets.only(top: 50),
              child: Center(child: CircularProgressIndicator(strokeWidth: 10, color: Color(0xff3a3a36),)))
        ]));
  }

  Widget contentNotDownloaded() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Click the Below Button to get Air Quality Index',
            style: GoogleFonts.ubuntu(color: Color(0xff3a3a36), fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget showContent() => _state == AppState.FINISHED_DOWNLOADING
      ? contentFinishedDownload()
      : _state == AppState.DOWNLOADING
      ? contentDownloading()
      : contentNotDownloaded();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [

        ],
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
          "Air Quality Index",
          style: GoogleFonts.ubuntu(color: Color(0xff3a3a36), fontWeight: FontWeight.bold),
        ),
      ),
      body: showContent(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: download,
        label: Text(
          ' AIR QUALITY INDEX',
          style: GoogleFonts.ubuntu(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        icon: const Icon(Icons.download),
        backgroundColor: Color(0xff3a3a36),
      ),
    );
  }
}