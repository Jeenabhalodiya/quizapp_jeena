import 'package:flutter/material.dart';
import 'package:quiz_app/home.dart';

class resultpage extends StatefulWidget {
  int marks;

  resultpage({Key? key, required this.marks}) : super(key: key);

  @override
  _resultpageState createState() => _resultpageState();
}

class _resultpageState extends State<resultpage> {
  int marks = 0;
  List<String> images = [
    "images/good.png",
    "images/jee.png",
    "images/bad.png",
  ];

  String message = '';
  String image = '';

  @override
  void initState() {
    if (marks < 20) {
      image = images[2];
      message = "You should try hard...\n" + "you scrod $marks";
    } else if (marks < 35) {
      image = images[1];
      message = "You can do better...\n" + "you scrod $marks";
    } else {
      image = images[0];
      message = "You did very well...\n" + "you scrod $marks";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Result",
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: Material(
              elevation: 10.0,
              child: Container(
                  child: Column(
                children: <Widget>[
                  Material(
                    child: Container(
                      width: 300.0,
                      height: 300.0,
                      child: ClipRect(
                        child: Image(
                          image: AssetImage(
                            image,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 15.0,
                      ),
                      child: Center(
                        child: Text(
                          message,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: "Quando",
                          ),
                        ),
                      )),
                ],
              )),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => homepage(),
                    ));
                  },
                  child: const Text(
                    "Continue",
                    style: TextStyle(fontSize: 18.0),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
