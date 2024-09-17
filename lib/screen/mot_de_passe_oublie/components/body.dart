import 'package:flutter/material.dart';
import 'package:share_file_iai/screen/connexion/connexion_screnn.dart';
import 'package:share_file_iai/screen/inscription/components/email_input.dart';
import 'package:share_file_iai/widget/bouton_continuer_2.dart';

import '../../inscription/InscriptionScreen.dart';
import '../../inscription/components/body.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 28, right: 28),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ConnexionScreen.routeName);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new),
                ),
                const Spacer(),
                const Text(
                  "Mot de passe oublié",
                  textScaleFactor: 1.1,
                  style: TextStyle(),
                ),
                const Spacer(flex: 2),
              ],
            ),
            const SizedBox(height: 90),
            const Text(
              "Mot de passe oublié",
              textScaleFactor: 2.2,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "S'il vous plait entrer votre email et on vous",
              style: TextStyle(
                letterSpacing: 1,
              ),
            ),
            const Text(
              "enverra un lien pour retrouver ce compte",
              style: TextStyle(
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 60),
            EmailInput(
              label: "Entrer votre email",
              controller: emailController,
            ),
            const SizedBox(height: 60),
            BottonContinuer2(size: size),
            const SizedBox(height: 20),
            RowAction(
              label: "Pas encore de compte ?",
              label2: "Creez-en-un",
              press: () {
                Navigator.pushNamed(context, InscriptionScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
