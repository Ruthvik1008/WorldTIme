import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map myData = {};
  @override
  Widget build(BuildContext context) {
    myData = myData.isNotEmpty ? myData : ModalRoute.of(context).settings.arguments;
    String url = myData['isDayTime'] ? 'lib/assets/day.jpg' : 'lib/assets/night.png';
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(url),
          fit: BoxFit.cover,
        )),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(myData['location'],
                      style: TextStyle(
                        fontSize: 60,
                        letterSpacing: 2,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ))
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(myData['time'],
                  style: TextStyle(
                    fontSize: 40,
                    letterSpacing: 2,
                    color: Colors.white,
                  )),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 425, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    
                    FlatButton.icon(
                      onPressed: () async{
                        dynamic result = await Navigator.pushNamed(context, '/location');
                        setState(() {
                          myData = {
                            'time': result['time'],
                            'location': result['location'],
                            'isDayTime': result['isDayTime'],
                            'flag': result['flag'], 
                          };
                        });
                        print(result['time']);
                      },
                      icon: Icon(
                        Icons.edit_location,
                        color: Colors.white,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                          side: BorderSide(color: Colors.white)),
                      color: Colors.transparent,
                      label: Text(
                        'edit location',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
