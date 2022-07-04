import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// IMPORTING AUTH
import 'package:finalyearproject/Auth/firebase-auth.dart';

// IMPORTING BADGES
import 'package:badges/badges.dart';

// IMPORTING GOOGLE FONTS
import 'package:google_fonts/google_fonts.dart';

// IMPORTING ION ICONS
import 'package:ionicons/ionicons.dart';

// IMPORTING PLATFORM ALERT DIALOG
import 'package:platform_alert_dialog/platform_alert_dialog.dart';

// IMPORTING SCREENS
import 'package:finalyearproject/Screens/exportScreens.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutScreen()));
                    },
                    icon: Icon(Icons.new_releases_outlined, color: Color(0xff3a3a36),)
                ),
                // Badge(
                //   position: BadgePosition.topEnd(top: 0.5, end: 8),
                //   badgeColor: Color(0xff3a3a36),
                //   badgeContent: Text("3", style: GoogleFonts.ubuntu(color: Colors.white, fontWeight: FontWeight.bold),),
                //   child: IconButton(
                //       // onPressed: () {
                //       //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutScreen()));
                //       // },
                //       onPressed: () {
                //         showDialog<void>(
                //           context: context,
                //           builder: (BuildContext context) {
                //             return PlatformAlertDialog(
                //               title: Center(
                //                 child: Text(
                //                   'What\'s New',
                //                   style: GoogleFonts.ubuntu(color: Color(0xff3a3a36), fontWeight: FontWeight.bold),
                //                 ),
                //               ),
                //               content: SingleChildScrollView(
                //                 child: ListBody(
                //                   children: <Widget>[
                //                     Card(
                //                       color: Colors.transparent,
                //                       elevation: 0.0,
                //                       child: ListTile(
                //                         leading: Icon(Ionicons.bookmark_outline, color: Color(0xff3a3a36),),
                //                         title: Padding(
                //                             padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                //                             child: GestureDetector(
                //                               onTap: () {
                //                                 //Navigator.of(context).push(MaterialPageRoute(builder: (context) => SafeAreaWidget()));
                //                               },
                //                               child: Text(
                //                                 'NEW DASHBOARD',
                //                                 overflow: TextOverflow.ellipsis,
                //                                 style: GoogleFonts.ubuntu(color: Color(0xff3a3a36)),
                //                               ),
                //                             )
                //                         ),
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //               actions: <Widget>[
                //                 PlatformDialogAction(
                //                   child: OutlinedButton(
                //                     style: OutlinedButton.styleFrom(
                //                       side: BorderSide(color: Color(0xff3a3a36)),
                //                     ),
                //                     onPressed: () {
                //                       Navigator.of(context).pop();
                //                     },
                //                     child: Text('OK', style: GoogleFonts.ubuntu(color: Color(0xff3a3a36), fontWeight: FontWeight.bold),),
                //                   ),
                //                 ),
                //               ],
                //             );
                //           },
                //         );
                //       },
                //       icon: Icon(Ionicons.notifications_outline, color: Color(0xff3a3a36),)
                //   ),
                // ),
                CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ],
            )
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0, 0),
          child: Text(
            "Hello, "+name,
            style: GoogleFonts.ubuntu(color: Color(0xff3a3a36), fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: DashboardDetails()
    );
  }
}