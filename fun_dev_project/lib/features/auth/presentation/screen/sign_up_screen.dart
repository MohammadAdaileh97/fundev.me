import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_dev_project/l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_dev_project/core/bottom_sheet/msg_bottom_sheet.dart';
import 'package:fun_dev_project/features/auth/presentation/cubit/signup_cubit.dart';
import 'package:fun_dev_project/features/auth/presentation/state/signup_state.dart';

import '../../../../core/utl/responsive.dart';
import '../../../../core/widget/custom_button.dart';
import '../../../../core/widget/custom_circular_progress_indicator.dart';
import '../../../../core/widget/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool obscurePasswordText = false;
  bool showErrorPassword = false;
  bool showErrorName = false;
  bool showErrorEmail = false;

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
                AppLocalizations.of(context)!.signup,
                style: TextStyle(
                  color: const Color(0xFF222222),
                  fontSize: 34,
                  fontFamily: 'Metropolis',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: responsiveHeight(context, 73)),

            CustomTextField(
              onChanged: (value) {
                showErrorName = nameController.text.isEmpty;
                setState(() {});
              },
              textEditingController: nameController,
              label: AppLocalizations.of(context)!.name,
              hintText: "",
              keyboardType: TextInputType.name,
              obscureText: false,
              suffixIcon:
                  nameController.text.isEmpty
                      ? SvgPicture.asset("assets/images/close.svg")
                      : SvgPicture.asset("assets/images/check.svg"),
              errorText:
                  nameController.text.isEmpty
                      ? AppLocalizations.of(context)!.nameIsRequired
                      : null,
            ),
            SizedBox(height: responsiveHeight(context, 8)),
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
            SizedBox(height: responsiveHeight(context, 8)),

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

            SizedBox(height: responsiveHeight(context, 16)),

            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.only(
                  left: responsiveWidth(context, 16),
                  right: responsiveWidth(context, 16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.alreadyHaveAnAccount,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: const Color(0xFF222222),
                        fontSize: 14,
                        fontFamily: 'Metropolis',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: responsiveWidth(context, 3)),
                    SvgPicture.asset("assets/images/round_arrow.svg"),
                  ],
                ),
              ),
            ),
            SizedBox(height: responsiveHeight(context, 32)),

            BlocListener<SignupCubit, SignUpState>(
              listener: (context, signUpState) {
                if (signUpState is SignUpStateSuccess) {
                  Navigator.pop(context);
                } else if (signUpState is SignUpStateError) {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return MsgBottomSheet(
                        msg: signUpState.errorMessage,
                        title: AppLocalizations.of(context)!.somethingWentWrong,
                        imagePath: "assets/images/wrong_bottom.svg",
                      );
                    },
                  );
                }
              },
              child: BlocBuilder<SignupCubit, SignUpState>(
                builder: (context, signUpState) {
                  if (signUpState is SignUpStateLoading) {
                    return CustomCircularProgressIndicator();
                  } else {
                    return CustomButton(
                      text: AppLocalizations.of(context)!.signup,
                      onTap: () {
                        context.read<SignupCubit>().signup(
                          email: emailController.text,
                          name: nameController.text,
                          password: passwordController.text,
                        );
                      },
                    );
                  }
                },
              ),
            ),

            SizedBox(height: responsiveHeight(context, 126)),
            Center(
              child: Text(
                AppLocalizations.of(context)!.or_login_with_social_account,
                style: TextStyle(
                  color: const Color(0xFF222222),
                  fontSize: 14,
                  fontFamily: 'Metropolis',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: responsiveHeight(context, 16)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/google.png"),
                SizedBox(width: responsiveWidth(context, 16)),
                Image.asset("assets/images/facebook.png"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
