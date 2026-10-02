import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_dev_project/l10n/app_localizations.dart';
import 'package:fun_dev_project/core/bottom_sheet/msg_bottom_sheet.dart';
import 'package:fun_dev_project/core/utl/responsive.dart';
import 'package:fun_dev_project/core/widget/custom_button.dart';
import 'package:fun_dev_project/core/widget/custom_circular_progress_indicator.dart';
import 'package:fun_dev_project/core/widget/custom_text_field.dart';

import '../cubit/change_password_cubit.dart';
import '../state/change_password_state.dart';

class ChangePasswordBottomSheet extends StatefulWidget {
  const ChangePasswordBottomSheet({super.key});

  @override
  State<ChangePasswordBottomSheet> createState() =>
      _ChangePasswordBottomSheetState();
}

class _ChangePasswordBottomSheetState extends State<ChangePasswordBottomSheet> {
  final TextEditingController oldPasswordEditingController =
      TextEditingController();
  final TextEditingController newPasswordEditingController =
      TextEditingController();
  final TextEditingController confirmPasswordEditingController =
      TextEditingController();

  @override
  void dispose() {
    oldPasswordEditingController.dispose();
    newPasswordEditingController.dispose();
    confirmPasswordEditingController.dispose();
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
              AppLocalizations.of(context)!.passwordChange,
              style: TextStyle(
                color: const Color(0xFF222222),
                fontSize: 18,
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: responsiveHeight(context, 18)),
            CustomTextField(
              textEditingController: oldPasswordEditingController,
              label: AppLocalizations.of(context)!.oldPassword,
              hintText: null,
            ),
            SizedBox(height: responsiveHeight(context, 14)),

            Container(
              margin: EdgeInsets.only(
                left: responsiveWidth(context, 16),
                right: responsiveWidth(context, 16),
              ),
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                AppLocalizations.of(context)!.forgotPassword,
                style: TextStyle(
                  color: const Color(0xFF9B9B9B),
                  fontSize: 14,
                  fontFamily: 'Metropolis',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: responsiveHeight(context, 18)),
            CustomTextField(
              textEditingController: newPasswordEditingController,
              label: AppLocalizations.of(context)!.newPassword,
              hintText: null,
            ),

            SizedBox(height: responsiveHeight(context, 18)),
            CustomTextField(
              textEditingController: confirmPasswordEditingController,
              label: AppLocalizations.of(context)!.repeatNewPassword,
              hintText: null,
            ),
            SizedBox(height: responsiveHeight(context, 32)),
            BlocListener<ChangePasswordCubit, ChangePasswordState>(
              listener: (context, changePasswordState) {
                if (changePasswordState is ChangePasswordStateSuccess) {
                  Navigator.pop(context);
                } else if (changePasswordState is ChangePasswordStateError) {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return MsgBottomSheet(
                        msg: changePasswordState.message,
                        title: AppLocalizations.of(context)!.somethingWentWrong,
                        imagePath: "assets/images/wrong_bottom.svg",
                      );
                    },
                  );
                }
              },
              child: BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
                builder: (context, changePasswordState) {
                  if (changePasswordState is ChangePasswordStateLoading) {
                    return CustomCircularProgressIndicator();
                  } else {
                    return CustomButton(
                      onTap: () {
                        context.read<ChangePasswordCubit>().changePassword(
                          oldPassword: oldPasswordEditingController.text,
                          newPassword: newPasswordEditingController.text,
                          confirmPassword:
                              confirmPasswordEditingController.text,
                          errorMsgOldPassword:
                              AppLocalizations.of(context)!.oldPasswordErrorMsg,
                          errorMsgNewPassword:
                              AppLocalizations.of(context)!.newPasswordErrorMsg,
                          errorMsgConfirmPassword:
                              AppLocalizations.of(
                                context,
                              )!.confirmPasswordErrorMsg,
                        );
                      },
                      text: AppLocalizations.of(context)!.savePassword,
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
