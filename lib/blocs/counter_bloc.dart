import 'dart:async';

import 'package:flutter_app/widgets/bloc_provider.dart';

class CounterBloc implements BlocBase {
  int _counter;

  // Stream to handle the counter
  StreamController<int> _counterController = StreamController<int>.broadcast();
  Sink<int> get _inAdd => _counterController.sink;
  Stream<int> get outCounter => _counterController.stream;

  CounterBloc() {
    _counter = 0;
  }

  int getCurrentState() {
    return _counter;
  }

  @override
  void dispose() {
    _counterController.close();
  }

  void increment() {
    _counter = _counter + 1;
    _inAdd.add(_counter);
  }
}
