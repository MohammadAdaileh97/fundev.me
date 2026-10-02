import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_dev_project/core/bottom_sheet/msg_bottom_sheet.dart';
import 'package:fun_dev_project/core/widget/custom_button.dart';
import 'package:fun_dev_project/core/widget/custom_circular_progress_indicator.dart';
import 'package:fun_dev_project/features/auth/presentation/cubit/forgot_password_cubit.dart';
import 'package:fun_dev_project/features/auth/presentation/screen/otp_screen.dart';

import '../../../../core/utl/responsive.dart';
import 'package:fun_dev_project/l10n/app_localizations.dart';

import '../../../../core/widget/custom_text_field.dart';
import '../state/forgot_password_state.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool showErrorEmail = false;
  TextEditingController emailController = TextEditingController();

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
                AppLocalizations.of(context)!.forgotPassword,
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
                AppLocalizations.of(
                  context,
                )!.pleaseEnterYourEmailAddressYouWillReceiveALinkToCreateANewPasswordViaEmail,
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
                showErrorEmail = !EmailValidator.validate(emailController.text);
                setState(() {});
              },
              textEditingController: emailController,
              label: AppLocalizations.of(context)!.email,
              hintText: "demo@demo.com",
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
              suffixIcon:
                  !EmailValidator.validate(emailController.text)
                      ? SvgPicture.asset("assets/images/close.svg")
                      : SvgPicture.asset("assets/images/check.svg"),
              errorText:
                  showErrorEmail
                      ? AppLocalizations.of(context)!.enterValidEmail
                      : null,
            ),
            SizedBox(height: responsiveHeight(context, 55)),
            BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
              listener: (context, forgotPasswordState) {
                if (forgotPasswordState is ForgotPasswordStateSuccess) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => OtpScreen(
                            id: forgotPasswordState.authEntity.id!,
                            otp: forgotPasswordState.authEntity.otp!,
                          ),
                    ),
                  );
                } else if (forgotPasswordState is ForgotPasswordStateError) {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return MsgBottomSheet(
                        msg: forgotPasswordState.errorMessage,
                        title: AppLocalizations.of(context)!.somethingWentWrong,
                        imagePath: "assets/images/wrong_bottom.svg",
                      );
                    },
                  );
                }
              },
              child: BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
                builder: (context, forgotPasswordState) {
                  if (forgotPasswordState is ForgotPasswordStateLoading) {
                    return const CustomCircularProgressIndicator();
                  } else {
                    return CustomButton(
                      text: AppLocalizations.of(context)!.send,
                      onTap: () {
                        context.read<ForgotPasswordCubit>().forgotPassword(
                          email: emailController.text,
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
