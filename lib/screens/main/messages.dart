import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MessagesWidget extends StatefulWidget {
  MessagesWidget({Key key}) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<MessagesWidget> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    print('Message');

    var card = new Card(
      child: new Column(
        children: <Widget>[
          new ListTile(
            leading: new Icon(Icons.account_box, color: Colors.blue,size: 26.0,),
            title: new Text("Yoga Hanggara"
              ,style: new TextStyle(fontWeight: FontWeight.w400),),
            subtitle: new Text("Software developer"),
          ),
          new Divider(color: Colors.blue,indent: 16.0,),
          new ListTile(
            leading: new Icon(Icons.email, color: Colors.blue, size: 26.0,),
            title: new Text("me@cleancode.id"
              ,style: new TextStyle(fontWeight: FontWeight.w400),),
          ),
          new ListTile(
            leading: new Icon(Icons.phone, color: Colors.blue, size: 26.0,),
            title: new Text("022-123456"
              ,style: new TextStyle(fontWeight: FontWeight.w400),),
          ),
          new Divider(color: Colors.blue,indent: 16.0,),
          new ListTile(
            leading: new Icon(Icons.account_box, color: Colors.blue,size: 26.0,),
            title: new Text("Yoga Hanggara"
              ,style: new TextStyle(fontWeight: FontWeight.w400),),
            subtitle: new Text("Software developer"),
          ),
          new Divider(color: Colors.blue,indent: 16.0,),
          new ListTile(
            leading: new Icon(Icons.email, color: Colors.blue, size: 26.0,),
            title: new Text("me@cleancode.id"
              ,style: new TextStyle(fontWeight: FontWeight.w400),),
          ),
          new ListTile(
            leading: new Icon(Icons.phone, color: Colors.blue, size: 26.0,),
            title: new Text("022-123456"
              ,style: new TextStyle(fontWeight: FontWeight.w400),),
          ),
        ],
      ),
    );

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Messages',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
        ],
      ),
    );

    return ListView(
      children: [
        Container(
          height: 200,
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
          ),
        ),
        titleSection,
        card
      ]
    );
  }
}