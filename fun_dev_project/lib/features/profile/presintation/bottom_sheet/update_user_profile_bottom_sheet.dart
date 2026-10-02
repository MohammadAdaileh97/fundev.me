import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_dev_project/l10n/app_localizations.dart';
import 'package:fun_dev_project/core/utl/responsive.dart';
import 'package:fun_dev_project/core/widget/custom_button.dart';
import 'package:fun_dev_project/core/widget/custom_text_field.dart';
import 'package:fun_dev_project/features/profile/presintation/cubit/update_user_profile_cubit.dart';
import 'package:fun_dev_project/features/profile/presintation/state/update_user_profile_state.dart';

import '../../../../core/bottom_sheet/msg_bottom_sheet.dart';
import '../../../../core/widget/custom_circular_progress_indicator.dart';
import '../../../auth/presentation/cubit/login_cubit.dart';

class UpdateUserProfileBottomSheet extends StatefulWidget {
  const UpdateUserProfileBottomSheet({super.key});

  @override
  State<UpdateUserProfileBottomSheet> createState() =>
      _UpdateUserProfileBottomSheetState();
}

class _UpdateUserProfileBottomSheetState
    extends State<UpdateUserProfileBottomSheet> {
  final TextEditingController nameTextEditingController =
      TextEditingController();
  final TextEditingController emailTextEditingController =
      TextEditingController();

  @override
  void dispose() {
    nameTextEditingController.dispose();
    emailTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        width: responsiveWidth(context, 375),

        decoration: ShapeDecoration(
          color: const Color(0xFFF9F9F9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(34),
              topRight: Radius.circular(34),
            ),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 30,
              offset: Offset(0, -4),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: responsiveHeight(context, 36)),
            Text(
              AppLocalizations.of(context)!.updateUserProfile,
              style: TextStyle(
                color: const Color(0xFF222222),
                fontSize: 18,
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: responsiveHeight(context, 18)),
            CustomTextField(
              textEditingController: nameTextEditingController,
              label: AppLocalizations.of(context)!.name,
              hintText: null,
            ),
            SizedBox(height: responsiveHeight(context, 14)),

            SizedBox(height: responsiveHeight(context, 18)),
            CustomTextField(
              textEditingController: emailTextEditingController,
              label: AppLocalizations.of(context)!.email,
              hintText: null,
            ),

            SizedBox(height: responsiveHeight(context, 32)),
            BlocListener<UpdateUserProfileCubit, UpdateUserProfileState>(
              listener: (context, updateUserProfileState) {
                if (updateUserProfileState is UpdateUserProfileStateSuccess) {
                  context.read<LoginCubit>().getFromPref();
                  Navigator.pop(context);
                } else if (updateUserProfileState
                    is UpdateUserProfileStateError) {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return MsgBottomSheet(
                        msg: updateUserProfileState.message,
                        title: AppLocalizations.of(context)!.somethingWentWrong,
                        imagePath: "assets/images/wrong_bottom.svg",
                      );
                    },
                  );
                }
              },
              child: BlocBuilder<
                UpdateUserProfileCubit,
                UpdateUserProfileState
              >(
                builder: (context, updateUserProfileState) {
                  if (updateUserProfileState is UpdateUserProfileStateLoading) {
                    return CustomCircularProgressIndicator();
                  } else {
                    return CustomButton(
                      onTap: () {
                        context.read<UpdateUserProfileCubit>().updateProfile(
                          name: nameTextEditingController.text,
                          email: emailTextEditingController.text,
                          errorMsgEmail:
                              AppLocalizations.of(context)!.enterValidEmail,
                          errorMsgName:
                              AppLocalizations.of(context)!.nameIsRequired,
                        );
                      },
                      text: AppLocalizations.of(context)!.save,
                    );
                  }
                },
              ),
            ),
            SizedBox(height: responsiveHeight(context, 32)),
          ],
        ),
      ),
    );
  }
}
