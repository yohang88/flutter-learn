import 'package:flutter/material.dart';
import 'package:flutter_app/models/Product.dart';

class ListViewPosts extends StatelessWidget {
  final List<Product> posts;

  ListViewPosts({Key key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: posts.length,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
          itemBuilder: (context, position) {
            return Column(
              children: <Widget>[
                Divider(height: 5.0),
                ListTile(
                  title: Text(
                    '${posts[position].title}',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                  subtitle: Text(
                    '${posts[position].body}',
                    style: new TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  onTap: () => _onTapItem(context, posts[position]),
                ),
              ],
            );
          }),
    );
  }

  void _onTapItem(BuildContext context, Product post) {
    Scaffold
        .of(context)
        .showSnackBar(new SnackBar(content: new Text(post.id.toString() + ' - ' + post.title)));
  }
}