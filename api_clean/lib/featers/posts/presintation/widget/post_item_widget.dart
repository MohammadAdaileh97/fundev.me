import 'package:api_clean/featers/posts/data/model/post_model.dart';
import 'package:flutter/material.dart';

class PostItemWidget extends StatelessWidget {
  PostModel postModel;

  PostItemWidget({super.key, required this.postModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(postModel.title),
          Text(postModel.body),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
              IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
            ],
          ),
          Divider(color: Colors.black, thickness: 1),
        ],
      ),
    );
  }
}
