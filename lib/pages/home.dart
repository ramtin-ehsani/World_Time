import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isEmpty ? ModalRoute.of(context).settings.arguments : data;
    String time = data['time'];
    String location = data['location'];
    bool isDayTime = data['isDayTime'];

    Color color = isDayTime ? Colors.orangeAccent[100] : Colors.indigo[900];
    String igBack = isDayTime ? 'day.png' : 'night.jpg';
    Color text = isDayTime ? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: color,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$igBack'),
              fit: BoxFit.cover,
            )
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,0,0,50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton.icon(
                    icon: Icon(
                      Icons.edit_location,
                      color: text,
                    ),
                    label: Text(
                      'Edit Location',
                      style: TextStyle(
                        color: text,
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () async{
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        time = result['time'];
                        isDayTime = result['isDayTime'];
                        location = result['location'];
                        data = {
                          'time' : result['time'],
                          'isDayTime' : result['isDayTime'],
                          'location' : result['location'],
                          'flag' : result['flag'],
                        };
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '$location',
                        style: TextStyle(
                          fontSize: 35,
                          color: text,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    '$time',
                    style: TextStyle(
                      fontSize: 60,
                      color: text,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
