import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_lang/controller/auth_controller.dart';
import 'package:theme_lang/l10n/app_localizations.dart';
import 'package:theme_lang/view/screens/main_screen.dart';
import 'package:theme_lang/view/screens/signup_screen.dart';
import 'package:theme_lang/view/widget/custom_button.dart';
import 'package:theme_lang/view/widget/custom_text_field.dart';

import '../../controller/note_controller.dart';
import '../../utl/const_value.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

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
              Image.asset("assets/images/notes.png", height: 150, width: 150),
              SizedBox(height: 20),

              Consumer<AuthController>(
                builder: (context, authController, child) {
                  return CustomTextField(
                    label: AppLocalizations.of(context)!.email,
                    textEditingController: emailController,
                    hintText: "demo@demo.com",
                    obscureText: false,
                    textInputType: TextInputType.emailAddress,
                    prefixIcon: Icon(Icons.email),
                    suffixIcon: null,
                    errorText:
                        authController.showErrorEmail
                            ? AppLocalizations.of(context)!.enterValidEmail
                            : null,
                  );
                },
              ),

              SizedBox(height: 20),

              Consumer<AuthController>(
                builder: (context, authController, child) {
                  return CustomTextField(
                    label: AppLocalizations.of(context)!.password,
                    textEditingController: passwordController,
                    hintText: AppLocalizations.of(context)!.enterYourPassword,
                    obscureText: !authController.showPassword,
                    textInputType: TextInputType.visiblePassword,
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: IconButton(
                      onPressed: () {
                        authController.changeShowPassword();
                      },
                      icon: Icon(
                        authController.showPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                    errorText:
                        authController.showErrorPassword
                            ? AppLocalizations.of(context)!.enterValidPassword
                            : null,
                  );
                },
              ),

              SizedBox(height: 20),
              Consumer<AuthController>(
                builder: (context, authController, child) {
                  return CustomButton(
                    text: AppLocalizations.of(context)!.login,
                    onTap: () async {
                      authController.checkEmail(emailController.text);
                      authController.checkPassword(passwordController.text);
                      if (authController.showErrorEmail ||
                          authController.showErrorPassword) {
                        return;
                      }

                      bool isLogin = await authController.login(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                      if (isLogin) {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();

                        int userID = prefs.getInt(ConstValue.userId) ?? -1;

                        Provider.of<NoteController>(
                          context,
                          listen: false,
                        ).getAllNotes(userId: userID);
                        if (!context.mounted) return;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MainScreen()),
                        );
                      } else {
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              AppLocalizations.of(
                                context,
                              )!.wrongEmailOrPassword,
                            ),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
              SizedBox(height: 20),
              Text(AppLocalizations.of(context)!.or),
              SizedBox(height: 20),
              Consumer<AuthController>(
                builder: (context, authController, child) {
                  return CustomButton(
                    text: AppLocalizations.of(context)!.sign_up,
                    onTap: () async {
                      authController.showErrorEmail = false;
                      authController.showErrorPassword = false;
                      if (!context.mounted) return;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
