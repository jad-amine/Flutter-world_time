import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime('London', 'uk.png', 'Europe/London'),
    WorldTime('Athens', 'greece.png', 'Europe/Berlin'),
    WorldTime('Cairo','egypt.png','Africa/Cairo'),
    WorldTime('Nairobi', 'kenya.png','Africa/Nairobi'),
    WorldTime('Chicago', 'usa.png','America/Chicago'),
    WorldTime('New York', 'usa.png','America/New_York'),
    WorldTime('Seoul', 'south_korea.png', 'Asia/Seoul'),
    WorldTime('Jakarta', 'indonesia.png','Asia/Jakarta'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
            title: const Text('Choose a location'),
            centerTitle: true,
            elevation: 0,
        ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: (){

                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
