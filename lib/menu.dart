import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'help.dart';
import 'questions.dart';

class MenuOptionsScreen extends StatefulWidget {
  @override
  _MenuOptionsScreenState createState() => _MenuOptionsScreenState();
}

class Option {
  Icon icon;
  String title;
  String subtitle;

  Option({this.icon, this.title, this.subtitle});
}

final options = [
  Option(
    icon: Icon(Icons.tv, size: 40.0),
    title: '1: TV/Film Round',
    subtitle:
        'Players of the quiz onto characters from films and TV shows and get the players to guess the series or movie.',
  ),
  Option(
    icon: Icon(Icons.language, size: 40.0),
    title: '2: Synonyms',
    subtitle:
        'A synonym is another word which means the same, in the same language.',
  ),
  Option(
    icon: Icon(Icons.local_car_wash, size: 40.0),
    title: '3: Logo Round',
    subtitle:
        'Participants then have to guess which company or brand each letter in the word represents.',
  ),
  Option(
    icon: Icon(Icons.pregnant_woman, size: 40.0),
    title: '4: Guess The Celebrity',
    subtitle: 'Recall celebritys face.',
  ),
  Option(
    icon: Icon(Icons.not_interested, size: 40.0),
    title: '5: True/False Quiz',
    subtitle: 'One of them is correct.',
  ),
  Option(
    icon: Icon(Icons.book, size: 40.0),
    title: '6: GK Quiz',
    subtitle: 'Check your GK.',
  ),
  Option(
    icon: Icon(Icons.videogame_asset, size: 40.0),
    title: '7: Sports Quiz',
    subtitle: 'Do you play.',
  ),
  Option(
    icon: Icon(Icons.zoom_out_map, size: 40.0),
    title: '8: Personality Quiz',
    subtitle:
        'A Personality Quiz is a highly engaging quiz that helps quiz takers learn something about themselves.',
  ),
];

class _MenuOptionsScreenState extends State<MenuOptionsScreen> {
  int _selectedOption = 0;
  int marks = 30;

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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        exitDialog();
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: Color(0xFFFAFAFA),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.red,
          title: Image.asset(
            'images/quizapplogo.jpg',
            width: 99.0,
            height: 100.0,
          ),
          actions: <Widget>[
            FlatButton(
              textColor: Colors.white,
              child: Text(
                'HELP',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () //=> print('HELP'),
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpScreen()),
                );
              },
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: options.length + 2,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return SizedBox(height: 15.0);
            } else if (index == options.length + 1) {
              return SizedBox(height: 100.0);
            }
            return Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10.0),
              width: double.infinity,
              height: 80.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: _selectedOption == index - 1
                    ? Border.all(color: Colors.black26)
                    : null,
              ),
              child: ListTile(
                leading: options[index - 1].icon,
                title: Text(
                  options[index - 1].title,
                  style: TextStyle(
                    color: _selectedOption == index - 1
                        ? Colors.black
                        : Colors.grey[600],
                  ),
                ),
                subtitle: Text(
                  options[index - 1].subtitle,
                  style: TextStyle(
                    color: _selectedOption == index - 1
                        ? Colors.black
                        : Colors.grey,
                  ),
                ),
                selected: _selectedOption == index - 1,
                onTap: () {
                  setState(() {
                    _selectedOption = index - 1;
                  });
                },
              ),
            );
          },
        ),
        bottomSheet: Container(
          width: double.infinity,
          height: 70.0,
          color: Color(0xFFF3F3F3),
          child: Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                FlatButton(
                    textColor: Colors.white,
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.body1,
                        children: [
                          TextSpan(
                            text: 'Save and Continue',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            ),
                          ),
                          WidgetSpan(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => getjson(_selectedOption)),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
