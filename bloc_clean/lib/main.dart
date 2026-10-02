import 'package:bloc_clean/featers/post/data/data_source/post_remote_data_source.dart';
import 'package:bloc_clean/featers/post/domain/use_case/get_all_post_use_case.dart';
import 'package:bloc_clean/featers/post/presintation/screen/posts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'featers/post/data/repostry/post_repostory_imp.dart';
import 'featers/post/domain/repostry/post_repostry.dart';
import 'featers/post/domain/use_case/create_post_use_case.dart';
import 'featers/post/domain/use_case/delete_post_use_case.dart';
import 'featers/post/domain/use_case/update_post_use_case.dart';
import 'featers/post/presintation/cubit/create_post_cubit.dart';
import 'featers/post/presintation/cubit/delete_post_cubit.dart';
import 'featers/post/presintation/cubit/get_all_post_cubit.dart';
import 'featers/post/presintation/cubit/update_post_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final PostRepostry postRepostry = PostRepostoryImp(
    postRemoteDataSource: PostRemoteDataSourceImp(),
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => GetAllPostCubit(
                getAllPostUseCase: GetAllPostUseCase(
                  postRepostry: postRepostry,
                ),
              )..getAllPost(),
        ),
        BlocProvider(
          create:
              (context) => CreatePostCubit(
                createPostUseCase: CreatePostUseCase(
                  postRepostry: postRepostry,
                ),
              ),
        ),
        BlocProvider(
          create:
              (context) => UpdatePostCubit(
                updatePostUseCase: UpdatePostUseCase(
                  postRepostry: postRepostry,
                ),
              ),
        ),
        BlocProvider(
          create:
              (context) => DeletePostCubit(
                deletePostUseCase: DeletePostUseCase(
                  postRepostry: postRepostry,
                ),
              ),
        ),
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
