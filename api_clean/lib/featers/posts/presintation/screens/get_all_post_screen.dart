import 'package:api_clean/featers/posts/presintation/screens/create_post_screen.dart';
import 'package:api_clean/featers/posts/presintation/widget/post_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/get_all_post_cubit.dart';
import '../state/get_all_post_state.dart';

class GetAllPostScreen extends StatelessWidget {
  const GetAllPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<GetAllPostCubit, GetAllPostState>(
        builder: (context, state) {
          if (state is GetAllPostStateLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetAllPostStateSuccess) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                return PostItemWidget(postModel: state.posts[index]);
              },
            );
          } else if (state is GetAllPostStateError) {
            return Center(child: Text(state.error));
          } else {
            return const SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreatePostScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
