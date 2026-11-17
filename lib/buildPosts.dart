import 'package:facebook/screen_colors.dart';
import 'package:flutter/material.dart';

class PostModel {
  final String userName;
  final String userImage;
  final String time;
  final String postImage;

   PostModel(
      {
    required this.userName,
    required this.userImage,
    required this.time,
    required this.postImage,
  }
  );
}
class PostItem extends StatelessWidget {
  final PostModel post;

  const PostItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.all(12),
          child: Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage(post.userImage ),
              ),
               SizedBox(width: 15 ,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.userName,
                      style:  TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      post.time,
                      style:  TextStyle(color: ScreenColors.grayColor, fontSize: 12),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon:  Icon(Icons.more_horiz),
              ),
            ],
          ),
        ),
        Image.asset(
          post.postImage,
          width: double.infinity,
          height: 500,
          fit: BoxFit.cover,
        ),
        Padding(
          padding:  EdgeInsets.all(12),
          child: Row(
            children:  [
              Icon(Icons.favorite_border),
              SizedBox(width: 16),
              Icon(Icons.chat_bubble_outline),
              SizedBox(width: 16),
              Icon(Icons.send_outlined),
              Spacer(),
              Icon(Icons.bookmark_border),
            ],
          ),
        ),
         Divider(height: 1),
      ],
    );
  }
}
