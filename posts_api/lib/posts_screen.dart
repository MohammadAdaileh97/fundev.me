import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:posts_api/post_model.dart';
import 'package:posts_api/update_post_screen.dart';

import 'create_post_screen.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  bool isLoading = true;
  List<PostModel> posts = [];

  @override
  void initState() {
    super.initState();
    getAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.purpleAccent),
      body:
          isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(posts[index].title!),
                    subtitle: Text(posts[index].body!),
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
                                        postModel: posts[index],
                                      ),
                                ),
                              );
                            },
                          ),
                        ),
                        posts[index].isLoading
                            ? CircularProgressIndicator()
                            : SizedBox(
                              height: 25,
                              child: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  deletePost(
                                    id: posts[index].id!,
                                    index: index,
                                  );
                                },
                              ),
                            ),
                      ],
                    ),
                  );
                },
                itemCount: posts.length,
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

  getAllPosts() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
    );
    isLoading = false;
    setState(() {});
    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      for (Map<String, dynamic> i in jsonBody) {
        posts.add(PostModel.fromJson(json: i));
      }
    }
    setState(() {});
  }

  deletePost({required int id, required int index}) async {
    posts[index].isLoading = true;
    setState(() {});
    final response = await http.delete(
      Uri.parse("https://jsonplaceholder.typicode.com/posts/$id"),
    );
    posts[index].isLoading = false;
    setState(() {});
    if (response.statusCode == 200) {
      posts.removeAt(index);
    }
    setState(() {});
  }
}
