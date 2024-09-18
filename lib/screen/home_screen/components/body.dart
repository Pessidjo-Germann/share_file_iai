import 'package:flutter/material.dart';
import 'package:share_file_iai/constante.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
        children: [
          textPresentation(
              msg: 'Bienvenue dans votre Espace de travail',
              fontWeight: FontWeight.w500,
              size: 17)
        ],
      ),
    );
  }
}
