import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/controller/count_controller.dart';
import 'package:provider_project/view/count_screen.dart';
import 'package:provider_project/view/posts_screen.dart';

import 'controller/post_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CountController()),
        ChangeNotifierProvider(create: (context) => PostController()..getAllPosts()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: PostsScreen(),
      ),
    );
  }
}
