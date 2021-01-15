import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';


class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url:'Africa/Lagos', location: 'Nigeria', flag: 'nigeria.jpg'),
    WorldTime(url:'Africa/Nairobi', location: 'Nairobi', flag: 'nairobi.png'),
    WorldTime(url:'Africa/Accra', location: 'Accra', flag: 'accra.png'),
    WorldTime(url:'Africa/Abidjan', location: 'Abidjan', flag: 'abidjan.png'),
    WorldTime(url:'Africa/Bissau', location: 'Bissau', flag: 'bissau.png'),
    WorldTime(url:'Africa/Casablanca', location: 'Casablanca', flag: 'casablanca.png'),
    WorldTime(url:'Africa/Johannesburg', location: 'Johannesburg', flag: 'johannesburg.png'),

  ];
  
  void getTime(index) async{
    WorldTime timeInstance = locations[index];
    await timeInstance.getTime();
    //navigate to the home page
    Navigator.pop(context, {
      'location': timeInstance.location,
      'time': timeInstance.time,
      'flag': timeInstance.flag,
      'theDayTime': timeInstance.theDayTime,
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        title: Text(
          'location',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.teal,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              onTap: (){
                getTime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/locations/${locations[index].flag}'),
              ),

            ),
          );
        } ,
      ),
    );
  }
}