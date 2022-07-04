import 'dart:async';
import 'package:flutter/material.dart';

// IMPORTING CROSS PLATFORM
import 'package:cross_platform/cross_platform.dart';

// IMPORTING GOOGLE FONTS
import 'package:google_fonts/google_fonts.dart';

// IMPORTING ION ICONS
import 'package:ionicons/ionicons.dart';

// IMPORTING PACKAGE INFO PLUS
import 'package:package_info_plus/package_info_plus.dart';

// IMPORTING WIDGETS
import 'package:finalyearproject/Widgets/export-widgets.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {

  Widget _buildContent() {
    if (Platform.isWeb) {
      return Text('Web');
    } else if (Platform.isAndroid) {
      return Text('Android');
    } else if (Platform.isIOS) {
      return Text('iOS');
    } else if (Platform.isMacOS) {
      return Text('MacOS');
    } else if (Platform.isLinux) {
      return Text('Linux');
    } else if (Platform.isWindows) {
      return Text('Windows');
    } else if (Platform.isFuchsia) {
      return Text('Fuchsia');
    } else {
      return Text('Undefined');
    }
  }

  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SalomonBottomNavigationBar()));
            },
            icon: Icon(Icons.chevron_left, color: Color(0xff3a3a36),)
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          "About",
          style: GoogleFonts.ubuntu(color: Color(0xff3a3a36), fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Center(
             child: Container(
               padding: EdgeInsets.fromLTRB(30, 25, 30, 30),
               alignment: Alignment.centerLeft,
               child: new ListBody(
                 children: <Widget>[
                   new Container(
                     height: 10.0,
                   ),
                   new ListTile(
                     leading: const Icon(Icons.apps),
                     title: const Text('App Name'),
                     subtitle: new Text(_packageInfo.appName),
                   ),
                   const Divider(height: 20.0),
                   new ListTile(
                     leading: const Icon(Icons.dashboard),
                     title: const Text('App ID'),
                     subtitle: new Text(_packageInfo.packageName),
                   ),
                   const Divider(height: 20.0),
                   new ListTile(
                     leading: const Icon(Icons.info),
                     title: const Text('App Version'),
                     subtitle: new Text(_packageInfo.version),
                   ),
                   const Divider(height: 20.0),
                   new ListTile(
                     leading: const Icon(Icons.devices),
                     title: const Text('Running on'),
                     subtitle: _buildContent(),
                   ),
                   // const Divider(height: 20.0),
                   // new ListTile(
                   //   leading: const Icon(Ionicons.logo_google_playstore),
                   //   title: const Text('Submit feedback on'),
                   //   subtitle: const Text('Google Play'),
                   // ),
                 ],
               ),
             ),
            )
          ],
        ),
      ),
    );
  }
}