import 'package:api_clean/featers/posts/data/data_source/posts_data_source.dart';
import 'package:api_clean/featers/posts/data/repositeries/post_repostory_imp.dart';
import 'package:api_clean/featers/posts/domain/repositries/post_repostiry.dart';
import 'package:api_clean/featers/posts/domain/use_case/create_post_use_case.dart';
import 'package:api_clean/featers/posts/domain/use_case/get_post_use_case.dart';
import 'package:api_clean/featers/posts/presintation/cubit/create_post_cubit.dart';
import 'package:api_clean/featers/posts/presintation/screens/get_all_post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'featers/posts/presintation/cubit/get_all_post_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  PostRepostoryImp postRepostiry = PostRepostoryImp(
    remoteDataSource: PostsRemoteDataSource(),
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => GetAllPostCubit(
                getPostsUseCase: GetPostUseCase(postRepostiry: postRepostiry),
              )..getAllPosts(),
        ),
        BlocProvider(
          create:
              (context) => CreatePostCubit(
                createPostUseCase: CreatePostUseCase(
                  postRepostiry: postRepostiry,
                ),
              ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: GetAllPostScreen(),
      ),
    );
  }
}
