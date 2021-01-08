import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stream_command_app/local.dart';

void main() {
  runApp(MyApp());
  Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
myapp1() {
  FlutterStatusbarcolor.setStatusBarColor(Colors.grey);
}

myt() {
  Fluttertoast.showToast(
      msg: "Hello, Welcome for Storing Data",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 20,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0);
}
class MyDrawerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: Icon(Icons.store),
        title: Text(
          'FIREBASE',
          style: TextStyle(fontFamily: 'Sriracha'),
        ),
      //  backgroundColor: Colors.purpleAccent[300],
    
      ),
      body:  
          Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          color: Colors.grey.shade200,
          margin: EdgeInsets.all(10),
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 200.0,
                        child: TextLiquidFill(
                          text: 'FIRESTORE',
                          waveColor: Colors.pinkAccent,
                          boxBackgroundColor: Colors.white,
                          textStyle: TextStyle(
                            fontFamily: 'LuckiestGuy',
                            fontSize: 29.0,
                            fontWeight: FontWeight.bold,
                          ),
                          boxHeight: 100.0,
                        ),
                      ),
                      Card(
                        color: Colors.white,
                        child: Image.asset('assets/panda.gif'),
                      ),
                      Card(
                        color: Colors.white,
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                                topRight: Radius.circular(30)),
                            side: BorderSide(width: 0, color: Colors.white)),
                        child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.white)),
                            color: Colors.purple,
                            onPressed: () {
                              myt();
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => new Local()));
                            },
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            )),
                      ),
                      //           
            ],
          ),
        ),
                              ],
              ),
                              
      ),
    );
  }
}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new MyDrawerApp())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.purple[100]),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 70.0,
                        child: Image.asset('assets/firebase.png'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        'Firebase App',
                        style: TextStyle(
                          //  fontFamily: 'RubikMonoOne',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 28.0),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text(
                      'DATABASE',
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.black),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}