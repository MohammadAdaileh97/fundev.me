import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:posts_api/post_model.dart';

class UpdatePostScreen extends StatefulWidget {
  PostModel postModel;

  UpdatePostScreen({super.key, required this.postModel});

  @override
  State<UpdatePostScreen> createState() => _UpdatePostScreenState();
}

class _UpdatePostScreenState extends State<UpdatePostScreen> {
  TextEditingController titleController = TextEditingController();

  TextEditingController bodyController = TextEditingController();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    titleController.text = widget.postModel.title.toString();
    bodyController.text = widget.postModel.body.toString();
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
              isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                    onPressed: () {
                      updatePost(
                        PostModel(
                          userId: widget.postModel.userId,
                          id: widget.postModel.id,
                          title: titleController.text,
                          body: bodyController.text,
                        ),
                      );
                    },
                    child: Text("Update Post"),
                  ),
            ],
          ),
        ),
      ),
    );
  }

  updatePost(PostModel post) async {
    isLoading = true;
    setState(() {});
    final response = await http.put(
      Uri.parse("https://jsonplaceholder.typicode.com/posts/${post.id}"),
      headers: {'Content-type': 'application/json; charset=UTF-8'},
      body: jsonEncode(post.toJson()),
    );
    isLoading = false;
    setState(() {});
    if (response.statusCode == 200) {
      Navigator.pop(context);
    }
  }
}
