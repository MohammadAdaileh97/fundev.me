import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../controller/post_controller.dart';
import '../model/post_model.dart';

class UpdatePostScreen extends StatelessWidget {
  PostModel postModel;
  int index;
  TextEditingController titleController = TextEditingController();

  TextEditingController bodyController = TextEditingController();

  UpdatePostScreen({super.key, required this.postModel, required this.index}) {
    titleController.text = postModel.title!;
    bodyController.text = postModel.body!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.text,
                controller: titleController,
                decoration: InputDecoration(
                  label: Text("Title"),
                  hintText: "Enter Title",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  icon: Icon(Icons.title),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: bodyController,
                decoration: InputDecoration(
                  label: Text("Body"),
                  hintText: "Enter Body",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  icon: Icon(Icons.content_paste),
                ),
              ),
              SizedBox(height: 20),

              Consumer<PostController>(
                builder: (context, postController, child) {
                  if (postController.isLoading) {
                    return CircularProgressIndicator();
                  } else {
                    return ElevatedButton(
                      onPressed: () async {
                        await postController.updatePost(
                          index: index,
                          post: PostModel(
                            userId: postModel.userId,
                            id: postModel.id,
                            title: titleController.text,
                            body: bodyController.text,
                          ),
                        );
                        Navigator.pop(context);
                      },
                      child: Text("Update Post"),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
