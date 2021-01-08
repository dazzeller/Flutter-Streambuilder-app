import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;




String x;
var cmd, webdata;

class Local extends StatefulWidget {
  @override
  _LocalState createState() => _LocalState();
}

class _LocalState extends State<Local> {

  
   web(cmd) async {
    print(x);
    var url = 'http://192.168.43.50/cgi-bin/task.py?x=${cmd}';
    var r = await http.get(url);
    webdata = r.body;
    setState(() {
    //  Text(webdata);
      webdata = r.body;
      });
    
   print(webdata);
  }



  @override
  Widget build(BuildContext context) {
    var db = FirebaseFirestore.instance;
    var database = db.collection('linuxserver').add({
      '$cmd': '$webdata',
    });


    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.storage),
        title: Text(
          'FireStore Database',
          style: TextStyle(fontFamily: 'Satisfy'),
        ),
      ),
       body: Container(
    //     color: Colors.black
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: Colors.black,
            child: Column(
              children: [
                Container(
                  child: Card(
                    color: Colors.black,
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(00),
                            bottomRight: Radius.circular(00),
                            topRight: Radius.circular(50)),
                        side: BorderSide(width: 2, color: Colors.amber)),
                    child: TextField(
                      textAlign: TextAlign.center,
                      onChanged: (val) {
                        cmd = val;
                      },
                      autocorrect: false,
                      cursorColor: Colors.blue,
                      style: TextStyle(
                        height: 1,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Enter Linux Command',
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.black,
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      side: BorderSide(width: 0, color: Colors.black)),
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.amber)),
                      color: Colors.black,
                      onPressed: () {
                      //  final play = AudioCache();
                     //   play.play('datastored_1.mp3');
                        web(cmd);
                        // ignore: unnecessary_statements
                        database;
                        print('hello');
                      },
                      child: Icon(
                        Icons.settings_power,
                        color: Colors.white,
                      )),
                ),
                Container(
                    width: double.infinity,
                    child: Card(
                      color: Colors.black,
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(00),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                              topRight: Radius.circular(00)),
                          side: BorderSide(width: 2, color: Colors.amber)),
                      child: Text(
                        webdata ??
                            "                       WELCOME TO CONSOLE...",
                        style: TextStyle(
                            height: 3,
                            color: Colors.white,
                            fontFamily: 'Sriracha'),
                      ),
                    )),


          

              ],
            ),
          ),
        ),
     ) 
     );
  }
}