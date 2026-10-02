import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_dev_project/core/bottom_sheet/msg_bottom_sheet.dart';
import 'package:fun_dev_project/core/widget/custom_button.dart';
import 'package:fun_dev_project/core/widget/custom_circular_progress_indicator.dart';
import 'package:fun_dev_project/features/auth/presentation/cubit/forgot_password_cubit.dart';
import 'package:fun_dev_project/features/auth/presentation/cubit/update_password_cubit.dart';
import 'package:fun_dev_project/features/auth/presentation/screen/login_screen.dart';
import 'package:fun_dev_project/features/auth/presentation/screen/otp_screen.dart';

import '../../../../core/utl/responsive.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/widget/custom_text_field.dart';
import '../state/forgot_password_state.dart';
import '../state/update_password_state.dart';

class UpdatePasswordScreen extends StatefulWidget {
  final String userId;

  const UpdatePasswordScreen({super.key, required this.userId});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  bool showErrorPassword = false;
  bool obscurePasswordText = true;

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: responsiveWidth(context, 16),
                right: responsiveWidth(context, 16),
              ),
              child: Text(
                AppLocalizations.of(context)!.newPassword,
                style: TextStyle(
                  color: const Color(0xFF222222),
                  fontSize: 34,
                  fontFamily: 'Metropolis',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: responsiveHeight(context, 87)),
            Padding(
              padding: EdgeInsets.only(
                left: responsiveWidth(context, 16),
                right: responsiveWidth(context, 16),
              ),
              child: Text(
                AppLocalizations.of(context)!.pleaseEnterTheNewPassword,
                style: TextStyle(
                  color: const Color(0xFF222222),
                  fontSize: 14,
                  fontFamily: 'Metropolis',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: responsiveHeight(context, 16)),
            CustomTextField(
              onChanged: (value) {
                showErrorPassword = passwordController.text.isEmpty;
                setState(() {});
              },
              textEditingController: passwordController,
              label: AppLocalizations.of(context)!.password,
              hintText: AppLocalizations.of(context)!.password,
              keyboardType: TextInputType.visiblePassword,
              obscureText: obscurePasswordText,
              suffixIcon: IconButton(
                onPressed: () {
                  obscurePasswordText = !obscurePasswordText;
                  setState(() {});
                },
                icon: Icon(
                  obscurePasswordText ? Icons.visibility_off : Icons.visibility,
                ),
              ),
              errorText:
                  showErrorPassword
                      ? AppLocalizations.of(context)!.passwordIsRequired
                      : null,
            ),

            SizedBox(height: responsiveHeight(context, 55)),
            BlocListener<UpdatePasswordCubit, UpdatePasswordState>(
              listener: (context, updatePasswordState) {
                if (updatePasswordState is UpdatePasswordStateSuccess) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (route) => false,
                  );
                } else if (updatePasswordState is UpdatePasswordStateError) {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return MsgBottomSheet(
                        title: AppLocalizations.of(context)!.somethingWentWrong,

                        msg: updatePasswordState.errorMessage,
                        imagePath: "assets/images/wrong_bottom.svg",
                      );
                    },
                  );
                }
              },
              child: BlocBuilder<UpdatePasswordCubit, UpdatePasswordState>(
                builder: (context, state) {
                  if (state is UpdatePasswordStateLoading) {
                    return const CustomCircularProgressIndicator();
                  } else {
                    return CustomButton(
                      text: AppLocalizations.of(context)!.update,
                      onTap: () {
                        context.read<UpdatePasswordCubit>().updatePassword(
                          id: widget.userId,
                          password: passwordController.text,
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
