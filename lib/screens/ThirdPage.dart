import 'package:flutter_app/CounterBLoC.dart';
import 'package:flutter_app/CounterEvent.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {

  final _bloc = CounterBLoC();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: ListView(
              children: [
                StreamBuilder(
                  stream: _bloc.stream_counter,
                  initialData: 0,
                  builder: (context, snapshot) {
                    return Text(snapshot.data.toString());
                  },
                ),
                new RaisedButton(
                  child: new Text('Add Counter'),
                  onPressed: () {
                    _bloc.counter_event_sink.add(IncrementEvent());
                  },
                ),
              ],
          )
      ),
    );
  }

  @override
  dispose(){
    super.dispose();
    _bloc.dispose();
  }
}
