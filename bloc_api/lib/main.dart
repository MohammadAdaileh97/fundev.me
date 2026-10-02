import 'package:bloc_api/cubt/delete_post_cubit.dart';
import 'package:bloc_api/cubt/update_post_cubit.dart';
import 'package:bloc_api/view/screens/posts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubt/create_post_cubit.dart';
import 'cubt/get_all_post_cubit.dart';
import 'cubt/get_comments_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetAllPostCubit()..getAllPosts()),
        BlocProvider(create: (context) => CreatePostCubit()),
        BlocProvider(create: (context) => UpdatePostCubit()),
        BlocProvider(create: (context) => DeletePostCubit()),
        BlocProvider(create: (context) => GetCommentsCubit()),
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
