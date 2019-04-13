import 'package:flutter/material.dart';
import 'package:flutter_app/models/Product.dart';
import 'package:flutter_app/repositories/ProductRepository.dart';

class BalanceWidget extends StatefulWidget {
  BalanceWidget({Key key}) : super(key: key);

  @override
  _BalanceState createState() => _BalanceState();
}

class _BalanceState extends State<BalanceWidget> {

  final Future<Product> product = fetchPost();

  @override
  Widget build(BuildContext context) {

    Widget textSection = Center(
      child: FutureBuilder<Product>(
        future: product,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data.title);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner
          return CircularProgressIndicator();
        },
      ),
    );

    return ListView(
        children: [
          textSection,
        ]
    );
  }
}