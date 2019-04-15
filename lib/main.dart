import 'package:flutter/material.dart';
import 'package:flutter_app/screens/MainPage.dart';
import 'package:flutter_app/screens/SecondPage.dart';
import 'package:flutter_app/screens/ThirdPage.dart';
import 'package:flutter_app/screens/FourthPage.dart';
import 'package:flutter_app/widgets/bloc_provider.dart';
import 'package:flutter_app/blocs/counter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('MyApp Build');

    return BlocProvider(
      bloc: CounterBloc(),
      child: MaterialApp(
        title: 'Yo Sleep',
        initialRoute: '/',
        routes: {
          '/': (context) => MainPage(),
          '/second': (context) => SecondPage(),
          '/third': (context) => ThirdPage(),
          '/fourth': (context) => FourthPage(),
        },
      ),
    );
  }
}

