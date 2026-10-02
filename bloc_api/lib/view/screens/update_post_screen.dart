import 'package:bloc_api/cubt/create_post_cubit.dart';
import 'package:bloc_api/cubt/get_all_post_cubit.dart';
import 'package:bloc_api/cubt/update_post_cubit.dart';
import 'package:bloc_api/state/update_post_state.dart';
import 'package:bloc_api/view/widget/custom_button.dart';
import 'package:bloc_api/view/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/post_model.dart';
import '../../state/create_post_state.dart';

class UpdatePostScreen extends StatelessWidget {
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController bodyTextEditingController = TextEditingController();
  PostModel postModel;
  int index;

  UpdatePostScreen({super.key, required this.postModel, required this.index}) {
    titleTextEditingController.text = postModel.title ?? "";
    bodyTextEditingController.text = postModel.body ?? "";
  }

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
      bottomNavigationBar: BlocListener<UpdatePostCubit, UpdatePostState>(
        listener: (context, state) {
          if (state is UpdatePostStateLoaded) {
            context.read<GetAllPostCubit>().updateList(
              post: state.post,
              index: index,
            );
            Navigator.pop(context);
          } else if (state is UpdatePostStateError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: BlocBuilder<UpdatePostCubit, UpdatePostState>(
          builder: (context, state) {
            if (state is UpdatePostStateLoading) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  text: "Save",
                  onTap: () {
                    context.read<UpdatePostCubit>().updatePost(
                      title: titleTextEditingController.text,
                      body: bodyTextEditingController.text,
                      userId: postModel.userId!,
                      id: postModel.id!,
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
