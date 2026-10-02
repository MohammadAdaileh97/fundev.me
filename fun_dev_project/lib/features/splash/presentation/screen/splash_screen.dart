import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fun_dev_project/core/utl/constant_values.dart';
import 'package:fun_dev_project/core/utl/secure_storage_helper.dart';
import 'package:fun_dev_project/features/auth/presentation/cubit/login_cubit.dart';
import 'package:fun_dev_project/features/auth/presentation/screen/login_screen.dart';
import 'package:fun_dev_project/features/main/presintation/screen/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      SecureStorageHelper()
          .getPrefString(key: ConstantValues.id, defaultValue: "")
          .then((userId) {
            if (userId != "") {
              context.read<LoginCubit>().getFromPref();
            }

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder:
                    (context) => userId == "" ? LoginScreen() : MainScreen(),
              ),
            );
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SvgPicture.asset("assets/images/logo.svg")),
    );
  }
}
