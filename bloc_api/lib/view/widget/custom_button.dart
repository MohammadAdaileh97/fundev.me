import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final GestureTapCallback? onTap;

  const CustomButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,

        height: 50,
        width: double.infinity,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.amber,
        ),
        child: Text(text, style: TextStyle(color: Colors.black,fontSize: 20)),
      ),
    );
  }
}
