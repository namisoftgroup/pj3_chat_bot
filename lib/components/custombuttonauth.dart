import 'package:flutter/material.dart';

///// انقلي ذا الكلاس الى الوق ان& الساين اب واحذفي الصفحة
class CustomButtonAuth extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const CustomButtonAuth({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 40,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      color: const Color.fromARGB(255, 120, 1, 129),
      textColor: Colors.white,
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
