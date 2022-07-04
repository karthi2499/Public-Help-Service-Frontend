import 'package:flutter/material.dart';

// IMPORTING AUTH
import 'package:finalyearproject/Auth/firebase-auth.dart';

// IMPORTING AVATAR GLOW
import 'package:avatar_glow/avatar_glow.dart';

// IMPORTING GOOGLE FONTS
import 'package:google_fonts/google_fonts.dart';

// IMPORTING ION ICONS
import 'package:ionicons/ionicons.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          "Profile",
          style: GoogleFonts.ubuntu(
              color: Color(0xff3a3a36), fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: AvatarGlow(
                        glowColor: Colors.green,
                        endRadius: 100.0,
                        child: Material(
                          shape: CircleBorder(),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(imageUrl),
                            radius: 50,
                          ),
                        ),
                        // child: Container(
                        //   height: 100,
                        //   width: 100,
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(50),
                        //       image: DecorationImage(
                        //           image: NetworkImage(imageUrl),
                        //           fit: BoxFit.cover)),
                        // ),
                      )
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50,),
            Card(
              color: Colors.transparent,
              elevation: 0.0,
              child: ListTile(
                leading: Icon(Ionicons.person_outline, color: Color(0xffACABA1),),
                title: Padding(
                    padding: const EdgeInsets.all(15),
                    child: GestureDetector(
                      onTap: () {
                        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => SafeAreaWidget()));
                      },
                      child: Text(
                        'Name',
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.ubuntu(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xffACABA1)),
                      ),
                    )
                ),
                subtitle: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                    child: GestureDetector(
                      onTap: () {
                        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => SafeAreaWidget()));
                      },
                      child: Text(
                        name,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.ubuntu(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xff3a3a36)),
                      ),
                    )
                ),
              ),
            ),
            Card(
              color: Colors.transparent,
              elevation: 0.0,
              child: ListTile(
                leading: Icon(Ionicons.mail_outline, color: Color(0xffACABA1),),
                title: Padding(
                    padding: const EdgeInsets.all(15),
                    child: GestureDetector(
                      onTap: () {
                        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => SafeAreaWidget()));
                      },
                      child: Text(
                        'E-Mail',
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.ubuntu(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xffACABA1)),
                      ),
                    )
                ),
                subtitle: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                    child: GestureDetector(
                      onTap: () {
                        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => SafeAreaWidget()));
                      },
                      child: Text(
                        email,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.ubuntu(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xff3a3a36)),
                      ),
                    )
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
