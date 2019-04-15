import 'package:flutter/material.dart';
import 'package:flutter_app/models/Product.dart';
import 'package:flutter_app/repositories/ProductRepository.dart';

import '_listPost.dart';

class ProfileWidget extends StatefulWidget {
  ProfileWidget({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfileWidget> {
  @override
  void dispose() {
    print('Profile Disposed');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Profile build');

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