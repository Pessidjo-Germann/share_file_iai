import 'package:flutter/material.dart';

class BottonContinuer2 extends StatelessWidget {
  const BottonContinuer2({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '');
      },
      child: SizedBox(
        child: Container(
            width: size.width,
            height: size.height * 0.065,
            decoration: BoxDecoration(
              color: const Color(0xff3737a0),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                "Continuer",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )),
      ),
    );
  }
}
