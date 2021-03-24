import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpScreen extends StatefulWidget {
  @override
  StuffInTiles createState() => StuffInTiles();
}

class StuffInTiles extends State<HelpScreen> {
  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print('Could not launch $command.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Help desk'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'FAQs and Support',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Quando',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ExpansionTile(
                trailing: Icon(
                  Icons.add_circle_outline,
                  size: 30,
                ),
                title: Text(
                  'About.',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Oswald',
                  ),
                ),
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Version: 1.0.0 \nProgramming: Aditya Bachal \nGame design: Aditya Bachal',
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Teko',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: ExpansionTile(
                trailing: Icon(
                  Icons.add_circle_outline,
                  size: 30,
                ),
                title: Text(
                  'What will happen if I accidentally lock my phone screen during a quiz round?',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Oswald',
                  ),
                ),
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'If you accidentally lock your phone while participating in a quiz contest but stay on the application then, the game shall resume from the exact points. However, the timer shall continue to run.',
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Teko',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: ExpansionTile(
                trailing: Icon(
                  Icons.add_circle_outline,
                  size: 30,
                ),
                title: Text(
                  'What will happen if I quit the app?',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Oswald',
                  ),
                ),
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Further, if a user for some known/unknown reason decides to quit the application, then user will not be allowed to join back the ongoing quiz.',
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Teko',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: ExpansionTile(
                trailing: Icon(
                  Icons.add_circle_outline,
                  size: 30,
                ),
                title: Text(
                  'Any futher questions or suggestions?',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Oswald',
                  ),
                ),
                children: <Widget>[
                  RaisedButton(
                    child: Text(
                      'Mail Us',
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Teko',
                      ),
                    ),
                    onPressed: () {
                      customLaunch(
                        'mailto:bachaladitya@gmail.com',
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: ExpansionTile(
                trailing: Icon(
                  Icons.add_circle_outline,
                  size: 30,
                ),
                title: Text(
                  'What is our criteria?',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Oswald',
                  ),
                ),
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'To help organize our evaluation of quizzing tools, we looked at a few key features and functionality.',
                      style: TextStyle(fontSize: 22, fontFamily: 'Teko'),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: ExpansionTile(
                trailing: Icon(
                  Icons.add_circle_outline,
                  size: 30,
                ),
                title: Text(
                  'Share app to family and friends?',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Oswald',
                  ),
                ),
                children: <Widget>[
                  RaisedButton(
                    child: Text(
                      'URL for app',
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Teko',
                      ),
                    ),
                    onPressed: () {
                      customLaunch(
                        'https://www.google.com/',
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: ExpansionTile(
                trailing: Icon(
                  Icons.add_circle_outline,
                  size: 30,
                ),
                title: Text('Question 7'),
                children: <Widget>[
                  Text('Answer 7'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
