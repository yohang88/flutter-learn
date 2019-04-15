import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  void dispose() {
    print('Second Disposed');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Widget cardSection = Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: MyCard()
    );

    return Scaffold(
      backgroundColor: Colors.green,
      body: ListView(
        children: <Widget>[
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