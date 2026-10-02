import 'package:flutter/material.dart';
import 'package:login/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  bool obscureText = true;
  bool showErrorEmail = false;
  bool showErrorPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset("assets/images/car_image.jpg"),
              SizedBox(height: 20),
              TextField(
                controller: emailTextEditingController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  errorText: showErrorEmail ? "Enter Email Address" : null,
                  label: Text("Email"),
                  prefixIcon: Icon(Icons.email),
                  hintText: "demo@demo.com",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),

              SizedBox(height: 20),
              TextField(
                controller: passwordTextEditingController,

                obscureText: obscureText,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  errorText: showErrorPassword ? "Enter Password" : null,
                  label: Text("Password"),
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: IconButton(
                    onPressed: () {
                      obscureText = !obscureText;
                      setState(() {});
                    },
                    icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                  hintText: "Enter Your Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),

              SizedBox(height: 20),

              TextButton(
                onPressed: () {
                  showErrorEmail =
                      !isEmail(email: emailTextEditingController.text);

                  showErrorPassword =
                      passwordTextEditingController.text.isEmpty;
                  setState(() {});

                  if (!showErrorEmail && !showErrorPassword) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => MainScreen(
                              email: emailTextEditingController.text,
                              password: passwordTextEditingController.text,
                            ),
                      ),
                    );
                  }
                },
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isEmail({required String email}) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(email);
  }
}
