import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location; //location name for the UI
  String time; //time in location
  String flag; // url for the location flag
  String url; // location url for the api
  dynamic  theDayTime; // the actual time

  WorldTime( {this.location, this.flag, this.url});



 Future<void> getTime () async {

   try {

     //make request
     Response response = await get(
         'http://worldtimeapi.org/api/timezone/$url');
     Map data = jsonDecode(response.body);
     //print(data);


     //get data
     String datetime = data['datetime'];
     String offset = data['utc_offset'].substring(1, 3);

     //print(datetime);
     //print(offset);

     //converting into daytime object
     DateTime now = DateTime.parse(datetime);
     var time_now = now.add(Duration(hours: int.parse(offset)));

     //set time property


     if (now.hour > 6 && now.hour < 20) {
       theDayTime = true;
     } else {
       theDayTime = false;
     }
     time = DateFormat.jm().format(time_now);
   }

   catch (e){
     time =' an error ';




   }
  }
}

