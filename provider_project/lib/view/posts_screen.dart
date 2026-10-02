import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:provider_project/controller/post_controller.dart';
import 'package:provider_project/view/update_post_screen.dart';

import 'create_post_screen.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.purpleAccent),
      body: Consumer<PostController>(
        builder: (context, postController, child) {
          if (postController.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(postController.posts[index].title!),
                  subtitle: Text(postController.posts[index].body!),
                  trailing: Column(
                    children: [
                      SizedBox(
                        height: 25,
                        child: IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => UpdatePostScreen(
                                      index: index,
                                      postModel: postController.posts[index],
                                    ),
                              ),
                            );
                          },
                        ),
                      ),
                      postController.posts[index].isLoading
                          ? CircularProgressIndicator()
                          : SizedBox(
                            height: 25,
                            child: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                postController.deletePost(
                                  id: postController.posts[index].id!,
                                  index: index,
                                );
                              },
                            ),
                          ),
                    ],
                  ),
                );
              },
              itemCount: postController.posts.length,
            );
          }
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreatePostScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
