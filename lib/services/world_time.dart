import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime{

  String location; // location name for the ui
  String? time; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  bool? isDayTime; // true or false if daytime or not for background image

  WorldTime(this.location, this.flag, this.url);

  // Fetch data from the 3rd party API
  Future<void> getTime() async{
    try{
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);

    // get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);

    // create a datetime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    // set the time property
    isDayTime = now.hour > 6 && now.hour < 20 ? true: false;
    time = DateFormat.jm().format(now);
    } catch (e) {
      print(e);
      time = "could not get time data";
    }
  }
}