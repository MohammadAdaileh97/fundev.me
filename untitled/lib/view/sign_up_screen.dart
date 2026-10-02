import 'package:flutter/material.dart';

import '../controller/db_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  label: Text(AppLocalizations.of(context)!.name),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),

              SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  label: Text(AppLocalizations.of(context)!.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),

              SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: obscureText,

                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      obscureText = !obscureText;
                      setState(() {});
                    },
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                  label: Text(AppLocalizations.of(context)!.password),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () async {
                  DbController dbController = DbController();
                  await dbController.register(
                    name: nameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  Navigator.pop(context);
                },
                child: Text(AppLocalizations.of(context)!.signUp),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(AppLocalizations.of(context)!.login),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
