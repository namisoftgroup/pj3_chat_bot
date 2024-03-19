import 'package:flutter/material.dart';

////delete this page later
class MyTextBox extends StatelessWidget {
  final String text;
  final String sectionName;
  final void Function()? onPressed;

  const MyTextBox({
    Key? key, // Add Key? key parameter
    required this.text,
    required this.sectionName,
    required this.onPressed,
  }) : super(key: key); // Pass key to super constructor

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.only(left: 15, bottom: 15),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // Align the icon to the right
            children: [
              Text(
                sectionName,
                style: TextStyle(color: Colors.grey[500]),
              ),
              IconButton(
                onPressed: onPressed,
                icon: const Icon(
                    Icons.settings), // Use Icon widget to display the icon
                color: Colors.grey,
              ),
            ],
          ),
          Text(text),
        ],
      ),
    );
  }
}
