import 'dart:convert';
import 'dart:developer';
import 'package:allevents/models/event_models.dart';
import 'package:http/http.dart' as http;

class EventList{
  List<EventModel> eventList = [];

  Future<List<EventModel>> getEventList(String data) async{ 
    

    final response = await http.get(Uri.parse(data));

    if (response.statusCode != 200) {
      print(response.reasonPhrase);
    }

    log(response.toString());

    var temp = json.decode(response.body);

    temp['item'].forEach((element){
      eventList.add(EventModel(
          element['eventname'].toString(),
          element['location'].toString(),
          element['event_url'].toString(),
          element['thumb_url'].toString()
        )
      );
    });
    return eventList;
  }
}