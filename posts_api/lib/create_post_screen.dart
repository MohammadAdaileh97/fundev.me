import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:posts_api/post_model.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  TextEditingController titleController = TextEditingController();

  TextEditingController bodyController = TextEditingController();

  bool isLoading = false;

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
              isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                    onPressed: () {
                      createPost(
                        PostModel(
                          userId: 1,
                          title: titleController.text,
                          body: bodyController.text,
                        ),
                      );
                    },
                    child: Text("Create Post"),
                  ),
            ],
          ),
        ),
      ),
    );
  }

  createPost(PostModel post) async {
    isLoading = true;
    setState(() {});
    final response = await http.post(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      headers: {'Content-type': 'application/json; charset=UTF-8'},
      body: jsonEncode(post.toJson()),
    );
    isLoading = false;
    setState(() {});
    if (response.statusCode == 201) {
      Navigator.pop(context);
    }
  }
}
