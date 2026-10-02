import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/post_model.dart';
import '../cubit/delete_post_cubit.dart';
import '../cubit/get_all_post_cubit.dart';
import '../screen/update_post_screen.dart';

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

            postModel.isLoading!
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
          ],
        ),
      ],
    );
  }
}
