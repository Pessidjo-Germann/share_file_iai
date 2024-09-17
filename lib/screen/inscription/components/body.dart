import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:share_file_iai/constante.dart';
import 'package:share_file_iai/screen/connexion/connexion_screnn.dart';
import 'package:share_file_iai/screen/inscription/components/confirm_password.dart';
import 'package:share_file_iai/screen/inscription/components/psd_input.dart';
import 'package:share_file_iai/widget/bouton_continuer_2.dart';

import 'email_input.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController psdController = TextEditingController();
    final TextEditingController newPsdController = TextEditingController();
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 28, right: 28),
          child: Center(
            child: Form(
              child: Column(
                children: [
                  const Text(
                    "Inscription",
                    textScaleFactor: 1.8,
                    style: TextStyle(),
                  ),
                  const SizedBox(height: 90),
                  const Text(
                    "Register Account",
                    textScaleFactor: 2.3,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Entrez vos informations",
                    style: TextStyle(
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 60),
                  Form(
                      child: Column(
                    children: [
                      EmailInput(
                        label: "Entrer votre email",
                        controller: emailController,
                      ),
                      const SizedBox(height: 20),
                      PassWordInput(
                        label: 'Entrer votre mot de passe',
                        controller: psdController,
                      ),
                      const SizedBox(height: 20),
                      ConfirmInput(
                        controller: newPsdController,
                        label: 'Confirmer votre mot de passe',
                      ),
                      const SizedBox(height: 10),
                    ],
                  )),
                  const Row(
                    children: [
                      Spacer(),
                    ],
                  ),
                  const SizedBox(height: 100),
                  BottonContinuer2(size: size),
                  const SizedBox(height: 18),
                  RowAction(
                    label: "Déjà un compte ?",
                    label2: "Connectez-vous ",
                    press: () {
                      Navigator.pushNamed(context, ConnexionScreen.routeName);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RowAction extends StatelessWidget {
  const RowAction({
    super.key,
    required this.label,
    required this.label2,
    required this.press,
  });
  final String label, label2;
  final GestureCancelCallback press;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 17,
          ),
        ),
        const SizedBox(width: 7),
        GestureDetector(
          onTap: press,
          child: Text(
            label2,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: kprimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
