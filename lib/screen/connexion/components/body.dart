import 'package:flutter/material.dart';
import 'package:share_file_iai/screen/inscription/components/email_input.dart';
import 'package:share_file_iai/screen/inscription/components/psd_input.dart';
import 'package:share_file_iai/widget/bouton_continuer_2.dart';

import '../../../constante.dart';
import '../../inscription/components/body.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController psdController = TextEditingController();
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 28, right: 28),
            child: Column(
              children: [
                const Text(
                  "Connexion",
                  textScaleFactor: 1.8,
                  style: TextStyle(),
                ),
                const SizedBox(height: 90),
                const Text(
                  "Welcome Back",
                  textScaleFactor: 2.3,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Utilise ton email et ton mot de passe",
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
                          label: "Entrer votre mot de passe",
                          controller: psdController),
                      const SizedBox(height: 18),
                      Row(
                        children: [
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "/forget");
                            },
                            child: const Text(
                              "Mot de passe oublié ?",
                              style: TextStyle(
                                fontSize: 17,
                                color: kprimaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 100),
                      BottonContinuer2(size: size),
                      const SizedBox(height: 18),
                      RowAction(
                        label: "Pas encore de compte ?",
                        label2: "Creez-en-un",
                        press: () {
                          Navigator.pushNamed(context, 'routeName');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
