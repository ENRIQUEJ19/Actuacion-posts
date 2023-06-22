import 'package:flutter/material.dart';

import '../constants.dart';
import '../model/posts.dart';

class DetailScreen extends StatelessWidget {
  final Posts post;

  const DetailScreen({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(post.autor),
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Autor: ${post.autor}', style: fromTextStyle),
              const SizedBox(height: 10.0),
              const Divider(color: primaryColor),
              const SizedBox(height: 10.0),
              Text(post.comentario, style: subjectTextStyle),
              const SizedBox(height: 5.0),
              Text(post.privacidad, style: dateTextStyle),
              const SizedBox(height: 10.0),
              const Divider(color: primaryColor),
              const SizedBox(height: 10.0),
              Text(post.visualizacion, style: bodyTextStyle),
            ],
          ),
        ));
  }
}
