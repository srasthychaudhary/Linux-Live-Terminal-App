import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:google_mobile_ads/google_mobile_ads.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  late String cmd;
  late String data = "OUTPUT";
  void cgi() async {
    var r = await http
        .get(Uri.http("13.233.116.194", "/cgi-bin/app.py", {"x": cmd}));
    data = r.body.toString();
    setState(() {
      data;
      print(data);
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("LIVE LINUX TERMINAL"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                child: Image.network(
                    "https://th.bing.com/th/id/R.772baf9baa36a115b147e5e114be2e0a?rik=PQUKUbgZwmDjVA&riu=http%3a%2f%2fopensourcewin.files.wordpress.com%2f2013%2f01%2fe1.jpg&ehk=gNYyw%2fl%2bB2UDcL3plgb7PChDnQTjZbZCv6rSKTiJ7wA%3d&risl=&pid=ImgRaw"),
                width: 350,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: TextField(
                  onChanged: (value) {
                    cmd = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "ENTER COMMAND",
                  ),
                ),
              ),
              Container(
                  child: TextButton(
                onPressed: cgi,
                child: Text("SUBMIT"),
              )),
              Container(
                  padding:
                      EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
                  width: 380,
                  height: 400,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.lightBlue,
                  ),
                  child: Center(
                    child: ListView(
                      children: [
                        Center(
                          child: Text(
                            "$data",
                            style: TextStyle(
                                fontSize: 8, fontWeight: FontWeight.w800),
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
