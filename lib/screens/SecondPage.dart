import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key, this.counter}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final int counter;

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    Widget cardSection = Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: MyCard()
    );

    return Scaffold(
      backgroundColor: Colors.green,
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Text(widget.counter.toString())
          ),
          cardSection,
          cardSection,
          cardSection,
          cardSection,
          cardSection,
          cardSection,
          cardSection,
        ],
      ),
    );
  }
}


class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('My Title', style: TextStyle(
            fontWeight: FontWeight.bold,
          )),
          SizedBox(height: 10),
          Text('We can use the crossAxisAlignment property to align our child  '
              'in the desired direction, for example, crossAxisAlignment.start '
              'would place the children with their start edge aligned with the '
              'start side of the cross axis.',
            softWrap: true,
          ),
        ],
      ),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: [
          new BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 5,
            offset: new Offset(0.0, 1.0),
          ),
        ]
      ),
    );
  }
}