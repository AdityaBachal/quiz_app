import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'menu.dart';

class resultPage extends StatefulWidget {
  int marks;

  resultPage({Key key, @required this.marks}) : super(key: key);

  @override
  _resultpageState createState() => _resultpageState(marks);
}

class _resultpageState extends State<resultPage> {
  Future<bool> exitDialog() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: Text('Are you sure?'),
        content: Text('Do you want to exit Appname je asel te?'),
        actions: [
          FlatButton(
            child: Text('EXIT'),
            onPressed: () {
              SystemNavigator.pop();
            },
          ),
          FlatButton(
            child: Text('CANCEL'),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          )
        ],
      ),
    );
  }

  List<String> images = [
    "images/success.gif",
    "images/good.gif",
    "images/bad.gif",
  ];

  String message;
  String image;

  @override
  void initState() {
    if (marks < 20) {
      image = images[2];
      message = "You Should Try Hard.\n" + "You Scored $marks marks.";
    } else if (marks < 35) {
      image = images[1];
      message = "You Can Do Better.\n" + "You Scored $marks marks.";
    } else {
      image = images[0];
      message = "You Did Very Well.\n" + "You Scored $marks marks.";
    }
    super.initState();
  }

  int marks;

  _resultpageState(this.marks);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        exitDialog();
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            "Result",
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 8,
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
                                fontSize: 18.0,
                                fontFamily: "Quando",
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => MenuOptionsScreen(),
                      ));
                    },
                    child: Text(
                      "Continue to home",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 9.0,
                      horizontal: 18.0,
                    ),
                    color: Colors.red,
                    splashColor: Colors.white70,
                    elevation: 10.0,
                  ),
                  RaisedButton(
                    onPressed: () {
                      exitDialog();
                    },
                    padding: EdgeInsets.symmetric(
                      vertical: 9.0,
                      horizontal: 42.0,
                    ),
                    child: Text(
                      'Exit Button',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                    color: Colors.red,
                    splashColor: Colors.white70,
                    elevation: 10.0,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
