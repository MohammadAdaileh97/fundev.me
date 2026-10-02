import 'package:bloc_api/model/post_model.dart';
import 'package:bloc_api/view/screens/comments_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubt/delete_post_cubit.dart';
import '../../cubt/get_all_post_cubit.dart';
import '../../cubt/get_comments_cubit.dart';
import '../../state/delete_post_state.dart';
import '../screens/update_post_screen.dart';

class PostWidget extends StatelessWidget {
  PostModel postModel;
  int index;

  PostWidget({super.key, required this.postModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(postModel.title ?? "-"),
        Text(postModel.body ?? "-"),
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => UpdatePostScreen(
                          postModel: postModel,
                          index: index,
                        ),
                  ),
                );
              },
              icon: Icon(Icons.edit),
            ),

            postModel.isLoading
                ? CircularProgressIndicator()
                : IconButton(
                  onPressed: () async {
                    context.read<GetAllPostCubit>().updateLoadingList(
                      index: index,
                    );

                    await context.read<DeletePostCubit>().deletePost(
                      id: postModel.id!,
                    );
                    context.read<GetAllPostCubit>().deleteList(index: index);
                  },
                  icon: Icon(Icons.delete),
                ),

            IconButton(
              onPressed: () {
                context.read<GetCommentsCubit>().getCommentsByPost(
                  postId: postModel.id!,
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CommentsScreen()),
                );
              },
              icon: Icon(Icons.comment),
            ),
          ],
        ),
      ],
    );
  }
}
