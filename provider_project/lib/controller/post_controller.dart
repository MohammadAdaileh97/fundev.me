import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider_project/model/post_model.dart';

class PostController extends ChangeNotifier {
  List<PostModel> posts = [];
  bool isLoading = true;

  getAllPosts() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
    );
    isLoading = false;
    notifyListeners();
    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      for (Map<String, dynamic> i in jsonBody) {
        posts.add(PostModel.fromJson(json: i));
      }
    }
    notifyListeners();
  }

  deletePost({required int id, required int index}) async {
    posts[index].isLoading = true;
    notifyListeners();
    final response = await http.delete(
      Uri.parse("https://jsonplaceholder.typicode.com/posts/$id"),
    );
    posts[index].isLoading = false;

    if (response.statusCode == 200) {
      posts.removeAt(index);
    }
    notifyListeners();
  }

  createPost(PostModel post) async {
    isLoading = true;
    notifyListeners();
    final response = await http.post(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      headers: {'Content-type': 'application/json; charset=UTF-8'},
      body: jsonEncode(post.toJson()),
    );
    isLoading = false;
    if (response.statusCode == 201) {
      var jsonBody = jsonDecode(response.body);
      posts.add(PostModel.fromJson(json: jsonBody));
    }
    notifyListeners();
  }

  updatePost({required PostModel post, required int index}) async {
    isLoading = true;
    notifyListeners();
    final response = await http.put(
      Uri.parse("https://jsonplaceholder.typicode.com/posts/${post.id}"),
      headers: {'Content-type': 'application/json; charset=UTF-8'},
      body: jsonEncode(post.toJson()),
    );
    isLoading = false;

    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      posts[index] = PostModel.fromJson(json: jsonBody);
    }
    notifyListeners();
  }
}
