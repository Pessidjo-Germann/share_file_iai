import 'package:flutter/material.dart';

class SpalshContent extends StatelessWidget {
  const SpalshContent({
    super.key,
    required this.img,
    required this.text,
  });
  final String img, text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //const SizedBox(height: 70),
          const Spacer(flex: 2),
          Center(child: Image.asset(img)),
          const SizedBox(height: 70),
          const Text(
            "APP SCHOOL",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          Text(
            text,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
