import 'package:flutter/material.dart';
import '../constants.dart';
import '../model/posts.dart';

class PostsWidget extends StatelessWidget {
  final Posts post;
  final Function onTap;
  final Function onSwipe;
  final Function onLongPress;

  const PostsWidget(
      {Key? key,
      required this.post,
      required this.onTap,
      required this.onSwipe,
      required this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        onSwipe(post.id);
      },
      onLongPress: () {
        onLongPress(post.id);
      },
      onTap: () {
        onTap(post);
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        height: 80.0,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 12.0,
                decoration: BoxDecoration(
                    color: post.read ? Colors.transparent : primaryColor,
                    shape: BoxShape.circle),
              ),
            ),
            Expanded(
              flex: 9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(post.autor,
                      style: dateTextStyle),
                  Text(post.comentario, style: fromTextStyle),
                  Text(post.privacidad, style: subjectTextStyle),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
