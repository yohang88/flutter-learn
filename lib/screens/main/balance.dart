import 'package:flutter/material.dart';
import 'package:flutter_app/models/Product.dart';
import 'package:flutter_app/repositories/ProductRepository.dart';

import '_listPost.dart';

class BalanceWidget extends StatefulWidget {
  BalanceWidget({Key key}) : super(key: key);

  @override
  _BalanceState createState() => _BalanceState();
}

class _BalanceState extends State<BalanceWidget> {
  @override
  Widget build(BuildContext context) {

    return Container(
      child: new FutureBuilder<List<Product>>(
        future: fetchListPost(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ListViewPosts(posts: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      )
    );
  }
}