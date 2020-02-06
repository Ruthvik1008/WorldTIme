import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class chooseLocation extends StatefulWidget {
  @override
  _chooseLocationState createState() => _chooseLocationState();
}

class _chooseLocationState extends State<chooseLocation> {
  @override
  void initState() {
    super.initState();
  }
  Map myData = {};
  
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
     
  }
  
  
  @override
  Widget build(BuildContext context) {
    //changes gradient color dynamically based on day or night
    myData = ModalRoute.of(context).settings.arguments;
    //Color colorStart = myData['isDayTime'] ? Colors.orange : Colors.blue[900];
    //Color colorEnd = myData['isDayTime'] ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: GradientAppBar(
        leading: new IconButton(
               icon: new Icon(Icons.arrow_back_ios, color: Colors.white),
               onPressed: () => Navigator.of(context).pop(null),
              ), 
        title: Text('choose location'),
        centerTitle: true,
        elevation: 0,
        backgroundColorStart: Colors.blue[900],
        backgroundColorEnd: Colors.black,

      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Card(
            color: Colors.white,
            child: ListTile(
              onTap: (){
                updateTime(index);
              },
              title: Text(locations[index].location),
            ),
            margin: EdgeInsets.fromLTRB(0,10,0,0),
          );
        },
      ),
    );
  }
}
