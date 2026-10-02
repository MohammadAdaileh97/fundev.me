import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_lang/view/widget/custom_button.dart';

import '../../controller/auth_controller.dart';
import '../widget/custom_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignupScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

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
                    label: AppLocalizations.of(context)!.user_name,
                    textEditingController: nameController,
                    hintText: AppLocalizations.of(context)!.pleaseEnterYourName,
                    obscureText: false,
                    prefixIcon: Icon(Icons.person),
                    errorText:
                        authController.showErrorName
                            ? AppLocalizations.of(context)!.pleaseEnterYourName
                            : null,
                    textInputType: TextInputType.name,
                    suffixIcon: null,
                  );
                },
              ),
              SizedBox(height: 20),
              Consumer<AuthController>(
                builder: (context, authController, child) {
                  return CustomTextField(
                    label: AppLocalizations.of(context)!.email,
                    textEditingController: emailController,
                    hintText: "demo@demo.com",
                    obscureText: false,
                    prefixIcon: Icon(Icons.email),
                    errorText:
                        authController.showErrorEmail
                            ? AppLocalizations.of(context)!.pleaseEnterYourEmail
                            : null,
                    textInputType: TextInputType.emailAddress,
                    suffixIcon: null,
                  );
                },
              ),
              SizedBox(height: 20),
              Consumer<AuthController>(
                builder: (context, authController, child) {
                  return CustomTextField(
                    label: AppLocalizations.of(context)!.password,
                    textEditingController: passwordController,
                    hintText:
                        AppLocalizations.of(context)!.pleaseEnterYourPassword,
                    obscureText: authController.showPassword,
                    prefixIcon: Icon(Icons.password),
                    errorText:
                        authController.showErrorPassword
                            ? AppLocalizations.of(
                              context,
                            )!.pleaseEnterYourPassword
                            : null,
                    textInputType: TextInputType.visiblePassword,
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
                  );
                },
              ),
              SizedBox(height: 20),
              Consumer<AuthController>(
                builder: (context, authController, child) {
                  return CustomTextField(
                    label: AppLocalizations.of(context)!.confirmPassword,
                    textEditingController: confPasswordController,
                    hintText:
                        AppLocalizations.of(
                          context,
                        )!.pleaseEnterYourConfirmPassword,
                    obscureText: authController.showConfPassword,
                    prefixIcon: Icon(Icons.password),
                    errorText:
                        authController.showErrorConfPassword
                            ? AppLocalizations.of(context)!.passwordDoesNotMatch
                            : null,
                    textInputType: TextInputType.visiblePassword,
                    suffixIcon: IconButton(
                      onPressed: () {
                        authController.changeShowConfPassword();
                      },
                      icon: Icon(
                        authController.showConfPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              Consumer<AuthController>(
                builder: (context, authController, child) {
                  return CustomButton(
                    text: AppLocalizations.of(context)!.sign_up,
                    onTap: () async {
                      authController.checkName(nameController.text);
                      authController.checkEmail(emailController.text);
                      authController.checkPassword(passwordController.text);
                      authController.checkConfPassword(
                        passwordController.text,
                        confPasswordController.text,
                      );
                      if (authController.showErrorName ||
                          authController.showErrorEmail ||
                          authController.showErrorPassword ||
                          authController.showErrorConfPassword) {
                        return;
                      }
                      await authController.signUp(
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                      );
                      Navigator.pop(context);
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
