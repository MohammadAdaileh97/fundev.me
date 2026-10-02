import 'package:bloc_api/cubt/get_all_post_cubit.dart';
import 'package:bloc_api/view/screens/add_post_screen.dart';
import 'package:bloc_api/view/widget/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state/get_all_posts_state.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<GetAllPostCubit, GetAllPostsState>(
        builder: (context, state) {
          if (state is GetAllPostLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GetAllPostSuccessState) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return PostWidget(postModel: state.posts[index], index: index);
              },
              itemCount: state.posts.length,
            );
          } else if (state is GetAllPostErrorState) {
            return Center(child: Text(state.message));
          } else {
            return SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPostScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
