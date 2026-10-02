import 'package:bloc_api/cubt/get_comments_cubit.dart';
import 'package:bloc_api/state/get_comments_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/comments_item.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<GetCommentsCubit, GetCommentsState>(
          builder: (context, state) {
            if (state is GetCommentsStateLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetCommentsStateLoaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return CommentsItem(commentsModel: state.comments[index]);
                },
                itemCount: state.comments.length,
              );
            } else if (state is GetCommentsStateError) {
              return const Center(child: Text("Something went wrong"));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
