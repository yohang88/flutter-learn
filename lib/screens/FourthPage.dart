import 'package:flutter/material.dart';

import 'package:flutter_app/blocs/counter_bloc.dart';
import 'package:flutter_app/widgets/bloc_provider.dart';

class FourthPage extends StatefulWidget {
  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  @override
  void dispose() {
    print('Fourth Disposed');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Fourth Page build');

    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: ListView(
              children: [
                new RaisedButton(
                  child: new Text('Add Counter'),
                  onPressed: () {
                    counterBloc.increment();
                  },
                ),
                StreamBuilder(
                  stream: counterBloc.outCounter,
                  initialData: counterBloc.getCurrentState(),
                  builder: (context, snapshot) {
                    return Text(snapshot.data.toString());
                  },
                ),
              ],
          )
      ),
    );
  }
}
