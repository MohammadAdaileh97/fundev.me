

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/create_post_cubit.dart';
import '../cubit/get_all_post_cubit.dart';
import '../state/create_post_state.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text_field.dart';

class AddPostScreen extends StatelessWidget {
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController bodyTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              CustomTextField(
                label: "Title",
                textEditingController: titleTextEditingController,
                hintText: "Please enter your title",
                obscureText: false,
                textInputType: TextInputType.multiline,
                prefixIcon: Icon(Icons.title),
                suffixIcon: null,
                errorText: null,
                maxLines: null,
              ),
              SizedBox(height: 20),
              CustomTextField(
                label: "Body",
                textEditingController: bodyTextEditingController,
                hintText: "Please enter your body",
                obscureText: false,
                textInputType: TextInputType.multiline,
                prefixIcon: Icon(Icons.content_paste),
                suffixIcon: null,
                errorText: null,
                maxLines: null,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BlocListener<CreatePostCubit, CreatePostState>(
        listener: (context, state) {
          if (state is CreatePostStateLoaded) {
            context.read<GetAllPostCubit>().addToList(post: state.post);
            Navigator.pop(context);
          } else if (state is CreatePostStateError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: BlocBuilder<CreatePostCubit, CreatePostState>(
          builder: (context, state) {
            if (state is CreatePostStateLoading) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  text: "Save",
                  onTap: () {
                    context.read<CreatePostCubit>().createPost(
                      title: titleTextEditingController.text,
                      body: bodyTextEditingController.text,
                      userId: 1,
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
