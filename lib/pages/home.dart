import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data :ModalRoute.of(context).settings.arguments;
    print(data);

    //setting background image
      String bgImage;
      if (data['theDayTime']) {
        bgImage = 'day.jpeg';
      }
      else {
        bgImage = 'night.jpeg';
      }
      Color bgColor = data['theDayTime'] ? Colors.lightBlue[400]: Colors.red;

    return Scaffold(

        backgroundColor: bgColor,
        body: SafeArea(child: Container(
          //setting background image
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 150,0,0),
            child: Column(
              children: [
                FlatButton.icon(
                  onPressed: () async{
                   dynamic result = await Navigator.pushNamed(context, '/chooselocation');
                    setState(() {
                      data = {
                        'time' : result['time'],
                        'location' : result['location'],
                        'flag' : result['flag'],
                        'theDayTime' : result['theDayTime'],
                      };
                    });
                  },
                  icon: Icon(
                      Icons.add_location_sharp,
                      color: Colors.deepOrangeAccent,
                      size: 60.0,
                  ),
                  label: Text(
                    'Choose location',
                    style: TextStyle(
                      color: Colors.orange[700],
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height:20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 40.0,
                        letterSpacing: 2.0,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 55.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        )),
    );
  }
}
