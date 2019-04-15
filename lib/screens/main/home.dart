import 'package:flutter/material.dart';

import 'package:flutter_app/widgets/bloc_provider.dart';
import 'package:flutter_app/blocs/counter_bloc.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeWidget> {

  @override
  Widget build(BuildContext context) {
    print('Home');

    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

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
            Icons.notifications,
            color: Colors.red[500],
          ),
          StreamBuilder(
            stream: counterBloc.outCounter,
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
            child: new Text('Second Page Screen'),
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            },
          ),
          new RaisedButton(
            child: new Text('Third Page Screen'),
            onPressed: () {
              Navigator.pushNamed(context, '/third');
            },
          ),
          new RaisedButton(
            child: new Text('Add Counter'),
            onPressed: () {
              counterBloc.increment();
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