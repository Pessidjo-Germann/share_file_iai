import 'package:flutter/material.dart';
import 'package:share_file_iai/constante.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            textPresentation(
                maxLine: 2,
                textAlign: TextAlign.start,
                msg: 'Bienvenue dans votre \nEspace de travail.',
                fontWeight: FontWeight.w500,
                color: Colors.black,
                size: 25),
            const SizedBox(height: 10),
            textPresentation(
                msg: 'Créer un nouvel elément',
                color: Colors.black,
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.start,
                size: 17),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                    child: BoxDocument(
                  file: 'assets/images/file.png',
                  message2: 'file',
                  message: 'Fichier',
                )),
                Expanded(
                    child: const BoxDocument(
                  file: 'assets/images/folder.png',
                  message2: 'document',
                  message: 'Documents',
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BoxDocument extends StatefulWidget {
  const BoxDocument(
      {super.key,
      required this.message,
      required this.message2,
      required this.file});
  final String message, message2, file;

  @override
  _BoxDocumentState createState() => _BoxDocumentState();
}

class _BoxDocumentState extends State<BoxDocument> {
  Color containerColor = Colors.white70; // Couleur par défaut

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          containerColor =
              const Color.fromARGB(255, 251, 201, 187); // Couleur au survol
        });
      },
      onExit: (_) {
        setState(() {
          containerColor = Colors.white70; // Revenir à la couleur par défaut
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(6),
            height: 200,
            color: containerColor, // Couleur dynamique
            child: Image.asset(widget.file, width: 150, height: 150),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textPresentation(
                    msg: widget.message,
                    fontWeight: FontWeight.bold,
                    size: 15,
                    color: kColorBlack,
                    textAlign: TextAlign.start),
                textPresentation(
                    msg: widget.message2,
                    fontWeight: FontWeight.w200,
                    size: 13,
                    color: kColorBlack,
                    textAlign: TextAlign.start),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
