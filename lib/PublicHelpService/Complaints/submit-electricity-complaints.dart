// IMPORTING FIREBASE AUTH
import 'dart:convert';

import 'package:finalyearproject/Auth/firebase-auth.dart';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'package:flutter/material.dart';

// IMPORTING CLOUD FIRESTORE
import 'package:cloud_firestore/cloud_firestore.dart';

// IMPORTING GOOGLE FONTS
import 'package:google_fonts/google_fonts.dart';



// String getRandom(int length){
//   const ch = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
//   Random r = Random();
//   return String.fromCharCodes(Iterable.generate(
//       length, (_) => ch.codeUnitAt(r.nextInt(ch.length))));
// }
//
// String getRandomNum(int length){
//   const ch = '1234567890';
//   Random r = Random();
//   return String.fromCharCodes(Iterable.generate(
//       length, (_) => ch.codeUnitAt(r.nextInt(ch.length))));
// }

class SubmitElectricityComplaints extends StatefulWidget {
  const SubmitElectricityComplaints({key}) : super(key: key);

  @override
  _SubmitElectricityComplaintsState createState() => _SubmitElectricityComplaintsState();
}

class _SubmitElectricityComplaintsState extends State<SubmitElectricityComplaints> {

  final _formKey=GlobalKey<FormState>();
  var date="";
  var mobile = "";
  var complaint="";
  var location="";
  final dateController=TextEditingController();
  final mobileController=TextEditingController();
  final locationController=TextEditingController();
  final complaintController=TextEditingController();

  clearText(){
    dateController.clear();
    mobileController.clear();
    locationController.clear();
    complaintController.clear();
  }

  CollectionReference electricity=FirebaseFirestore.instance.collection('ELECTRICITY-COMPLAINTS');
  Future<void> addUser(){
    return electricity.add({'name':name,'email':email,'date': date,'mobile':mobile,'location':location.toUpperCase(),'complaint':complaint.toUpperCase()});
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
          "Electricity",
          style: GoogleFonts.ubuntu(color: Color(0xff3a3a36), fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: _formKey,
        child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 30.0),
            child:ListView(
              children: [
                Container(
                    margin:const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                    child:TextFormField(
                        enabled: false,
                        autofocus: false,
                        decoration: InputDecoration(
                            labelText: name,
                            labelStyle: TextStyle(fontSize: 20.0),
                            border: OutlineInputBorder(),
                            errorStyle:
                            TextStyle(color: Colors.red,fontSize: 15)
                        ),
                    )
                ),
                Container(
                    margin:const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                    child:TextFormField(
                        autofocus: false,
                        enabled: false,
                        decoration: InputDecoration(
                            labelText: email,
                            labelStyle: TextStyle(fontSize: 20.0),
                            border: OutlineInputBorder(),
                            errorStyle:
                            TextStyle(color: Colors.red,fontSize: 15)
                        ),
                    )
                ),
                Container(
                    margin:const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                    child:TextFormField(
                        keyboardType: TextInputType.datetime,
                        autofocus: false,
                        decoration: const InputDecoration(
                            labelText: 'Date',
                            hintText: 'DD/MM/YY',
                            labelStyle: TextStyle(fontSize: 20.0),
                            border: OutlineInputBorder(),
                            errorStyle:
                            TextStyle(color: Colors.red,fontSize: 15)
                        ),
                        controller: dateController,
                        validator: (value){
                          if(value==null || value.isEmpty){
                            return 'ENTER A VALID INPUT';
                          }
                          return null;
                        }
                    )
                ),
                Container(
                    margin:const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                    child:TextFormField(
                        keyboardType: TextInputType.number,
                        autofocus: false,
                        decoration: InputDecoration(
                            labelText: 'Mobile Number',
                            labelStyle: TextStyle(fontSize: 20.0),
                            border: OutlineInputBorder(),
                            errorStyle:
                            TextStyle(color: Colors.red,fontSize: 15)
                        ),
                        controller: mobileController,
                        validator: (value){
                          if(value==null || value.isEmpty){
                            return 'ENTER A VALID INPUT';
                          }
                          return null;
                        }
                    )
                ),
                Container(
                    margin:const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                    child:TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        decoration: const InputDecoration(
                            labelText: 'Location',
                            labelStyle: TextStyle(fontSize: 20.0),
                            border: OutlineInputBorder(),
                            errorStyle:
                            TextStyle(color: Colors.red,fontSize: 15)
                        ),
                        controller: locationController,
                        validator: (value){
                          if(value==null || value.isEmpty){
                            return 'ENTER A VALID INPUT';
                          }
                          return null;
                        }
                    )
                ),
                Container(
                    margin:const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                    child:TextFormField(
                        maxLines: 2,
                        keyboardType: TextInputType.multiline,
                        autofocus: false,
                        decoration: const InputDecoration(
                            labelText: 'Complaint',
                            labelStyle: TextStyle(fontSize: 20.0),
                            border: OutlineInputBorder(),
                            errorStyle:
                            TextStyle(color: Colors.red,fontSize: 15)
                        ),
                        controller: complaintController,
                        validator: (value){
                          if(value==null || value.isEmpty){
                            return 'ENTER A VALID INPUT';
                          }
                          return null;
                        }
                    )
                ),
                const SizedBox(height: 8.0,),
                Container(
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Color(0xff3a3a36),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              side: BorderSide(
                                color: Color(0xff3a3a36),
                              )
                          ),
                          onPressed: () {
                            if(_formKey.currentState!.validate()){
                              setState(() {
                                date=dateController.text;
                                mobile=mobileController.text;
                                location=locationController.text;
                                complaint=complaintController.text;
                                addUser();
                                print(name);
                                print(email);
                                print(mobile);
                                ElectrictyComplaints(name,email,mobile,location,complaint);
                                clearText();
                              });
                            }
                          },
                          child: Text(
                            "SUBMIT",
                            style: GoogleFonts.ubuntu(
                                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Color(0xff3a3a36),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              side: BorderSide(
                                color: Color(0xff3a3a36),
                              )
                          ),
                          onPressed: () {
                            clearText();
                          },
                          child: Text(
                            "RESET",
                            style: GoogleFonts.ubuntu(
                                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ],
                    )
                )
              ],
            )
        ),
      ),
    );

  }

}

ElectrictyComplaints(name, email, mobile,location,complaint) async {
  var url = "https://public-help-service-backend.herokuapp.com/ElectrictyComplaints";
  final http.Response response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',

    },
    body: jsonEncode(<String, String>{
      'name': name,
      'email': email,
      'mobile': mobile,
      'location': location,
      'complaint': complaint,
    }),
  );
  print(response.body);
  // if (response.statusCode == 201) {
  // } else {
  //   throw Exception('Failed to create album.');
  // }
}