import 'package:allevents/helper/getEvents.dart';
import 'package:allevents/models/event_models.dart';
import 'package:allevents/pages/webViewPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EventListing extends StatefulWidget {
  final String data;
  final String title;
  const EventListing({required this.data, required this.title, super.key});

  @override
  State<EventListing> createState() => _EventListingState();
}

class _EventListingState extends State<EventListing> {
  List<EventModel> eventList = <EventModel>[];
  bool _loading = true;
  bool isListView = true;

  @override
  void initState() {
    super.initState();
    getCatagory();
  }

  getCatagory() async {
    EventList eventListing = EventList();
    eventList = await eventListing.getEventList(widget.data);
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(isListView ? Icons.grid_view : Icons.list),
            onPressed: () {
              setState(() {
                isListView = !isListView;
              });
            },
          ),
        ],
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, ),
                child: Column(
                  children: [
                    //blogs
                    Container(
                      padding: EdgeInsets.only(top: 16),
                      child: isListView ? buildListView() : buildGridView(),
                    )
                  ],
                ),
              ),
            ),
    );
  }

  Widget buildListView() {
    return ListView.builder(
      itemCount: eventList.length,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Card(
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  
                ),
                child: Image.network(
                  eventList[index].thumb_url,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.6,
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                              text: eventList[index].eventname,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ]),
                    ),
                    // Text(
                    //   eventList[index].eventname,
                    //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    // ),
                    Text(
                      eventList[index].location,
                    ),
                  ],
                ),
              )
            ]),
          ),
          // Text(eventList[index].eventname),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WebviewPage(
                          url: eventList[index].event_url,
                        )));
          },
        );
      },
    );
  }

  Widget buildGridView() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: eventList.length,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Text(eventList[index].eventname),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WebviewPage(
                          url: eventList[index].event_url,
                        )));
          },
        );
      },
    );
  }
}
