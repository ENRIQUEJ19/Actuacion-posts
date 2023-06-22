import 'package:flutter/material.dart';

import '../constants.dart';
import '../model/backend.dart';
import '../model/posts.dart';
import '../widgets/post_widget.dart';
import 'detail_screen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  // State.
  var posts = Backend().getPosts();

  void markPostsAsRead(int id) {
    Backend().markPostsAsRead(id);
    setState(() {
      posts = Backend().getPosts();
    });
  }

  void deletePosts(int id) {
    Backend().deletePosts(id);
    setState(() {
      posts = Backend().getPosts();
    });
  }

  void showDetail(Posts post) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DetailScreen(post: post);
    }));

    Backend().markPostsAsRead(post.id);
    setState(() {
      posts = Backend().getPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemCount: posts.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(
          color: primaryColor,
          indent: 40.0,
          endIndent: 20.0,
        ),
        itemBuilder: (BuildContext context, int index) => PostsWidget(
          post: posts[index],
          onTap: showDetail,
          onLongPress: markPostsAsRead,
          onSwipe: deletePosts,
        ),
      ),
    );
  }
}
