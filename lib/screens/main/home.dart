import 'package:flutter/material.dart';
import 'package:flutter_app/screens/SecondPage.dart';
import 'package:flutter_app/screens/ThirdPage.dart';

import 'package:flutter_app/CounterBLoC.dart';
import 'package:flutter_app/CounterEvent.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key key, this.counter}) : super(key: key);

  final int counter;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeWidget> {

  final _bloc = CounterBLoC();

  @override
  Widget build(BuildContext context) {

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
                    'Home',
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
          Text(widget.counter.toString()),
          Icon(
            Icons.notifications,
            color: Colors.red[500],
          ),
          StreamBuilder(
            stream: _bloc.stream_counter,
            initialData: 0,
            builder: (context, snapshot) {
              return Text(snapshot.data.toString());
            },
          ),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    return ListView(
        children: [
          Image.asset('images/lake.jpg'),
          titleSection,
          buttonSection,
          textSection,
          new RaisedButton(
            child: new Text('Next Screen'),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => new SecondPage(
                    counter: widget.counter,
                  ),
                ),
              );
            },
          ),
          new RaisedButton(
            child: new Text('Third Page Screen'),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => new ThirdPage(),
                ),
              );
            },
          ),
          new RaisedButton(
            child: new Text('Add Counter'),
            onPressed: () {
              _bloc.counter_event_sink.add(IncrementEvent());
            },
          ),
          textSection,
          textSection,
        ]
    );
  }
}


Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );
}