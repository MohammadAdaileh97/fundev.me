import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_dev_project/l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fun_dev_project/core/bottom_sheet/msg_bottom_sheet.dart';
import 'package:fun_dev_project/core/utl/responsive.dart';
import 'package:fun_dev_project/core/widget/custom_button.dart';
import 'package:fun_dev_project/core/widget/custom_circular_progress_indicator.dart';
import 'package:fun_dev_project/core/widget/custom_text_field.dart';
import 'package:fun_dev_project/features/auth/presentation/cubit/login_cubit.dart';
import 'package:fun_dev_project/features/auth/presentation/screen/forgot_password_screen.dart';
import 'package:fun_dev_project/features/auth/presentation/screen/sign_up_screen.dart';
import 'package:fun_dev_project/features/auth/presentation/state/login_state.dart';
import 'package:fun_dev_project/features/main/presintation/screen/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool obscurePasswordText = false;
  bool showErrorPassword = false;
  bool showErrorEmail = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: responsiveWidth(context, 16),
                right: responsiveWidth(context, 16),
              ),
              child: Text(
                AppLocalizations.of(context)!.login,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForgotPasswordScreen(),
                  ),
                );
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
                      AppLocalizations.of(context)!.forgotYourPassword,
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
            BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginStateSuccess) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => MainScreen()),
                    (route) => false,
                  );
                } else if (state is LoginStateError) {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return MsgBottomSheet(
                        msg: state.errorMessage,
                        title: AppLocalizations.of(context)!.somethingWentWrong,
                        imagePath: "assets/images/wrong_bottom.svg",
                      );
                    },
                  );
                }
              },
              child: BlocBuilder<LoginCubit, LoginState>(
                builder: (context, loginState) {
                  if (loginState is LoginStateLoading) {
                    return CustomCircularProgressIndicator();
                  } else {
                    return CustomButton(
                      text: AppLocalizations.of(context)!.login,
                      onTap: () {
                        if (emailController.text.isEmpty) {
                          showErrorEmail = true;
                          setState(() {});
                          return;
                        }
                        if (passwordController.text.isEmpty) {
                          showErrorPassword = true;
                          setState(() {});
                          return;
                        }

                        context.read<LoginCubit>().login(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      },
                    );
                  }
                },
              ),
            ),
            SizedBox(height: responsiveHeight(context, 32)),

            CustomButton(
              text: AppLocalizations.of(context)!.register,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
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
