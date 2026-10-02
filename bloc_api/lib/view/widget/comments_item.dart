import 'package:bloc_api/model/comments_model.dart';
import 'package:flutter/material.dart';

class CommentsItem extends StatelessWidget {
  final CommentsModel commentsModel;

  const CommentsItem({super.key, required this.commentsModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            commentsModel.name ?? "",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            commentsModel.email ?? "",
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 5),
          Text(commentsModel.body ?? "", style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 10),
          const Divider(color: Colors.grey),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
