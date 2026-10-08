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
  late final Timer _navigationTimer;

  @override
  void initState() {
    super.initState();

    _navigationTimer = Timer(const Duration(seconds: 3), () async {
      try {
        final userId = await SecureStorageHelper().getPrefString(
          key: ConstantValues.id,
          defaultValue: "",
        );

        if (!mounted) return;

        if (userId != "") {
          context.read<LoginCubit>().getFromPref();
        }

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => userId == "" ? LoginScreen() : MainScreen(),
          ),
        );
      } catch (_) {
        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _navigationTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SvgPicture.asset("assets/images/logo.svg")),
    );
  }
}
