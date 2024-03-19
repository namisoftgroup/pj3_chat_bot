import 'package:flutter/material.dart';

///////delete this page later
class CustomLogoAuth extends StatelessWidget {
  const CustomLogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      alignment: Alignment.center,
      width: 80,
      height: 80,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(70)),

      child: const Icon(Icons.person_2_rounded),

      // fit: BoxFit.fill,
    ));
  }
}
