import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:share_file_iai/screen/liste_fichier/list_file.dart';
import 'package:share_file_iai/widget/bouton_continuer_2.dart';

class FolderListPage extends StatelessWidget {
  const FolderListPage({super.key});

  @override
  Widget build(BuildContext context) {
    String initalValue = '';
    final TextEditingController _folderNameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes Dossiers'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('folder')
            .orderBy('createdAt',
                descending: true) // Trier par date de création
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final folders = snapshot.data!.docs;

          return ListView.builder(
            itemCount: folders.length,
            itemBuilder: (context, index) {
              final folder = folders[index];

              return ListTile(
                leading: Icon(Icons.folder,
                    color: Colors.yellow[700], size: 40), // Icône dossier
                title: Text(folder['name']),
                trailing: PopupMenuButton(
                  initialValue: initalValue,
                  onSelected: (value) {
                    if (value == 'put') {
                      //on modifie le nom du dossiers
                      _showModifyFolderModal(
                          context, _folderNameController, folders[index].id);
                    } else if (value == 'delete') {
                      //on supprime
                      _showDeleteFolder(
                          context, folders[index].id, folder['name']);
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      const PopupMenuItem<String>(
                        value: 'put', // Valeur retournée lors de la sélection
                        child: Text('Renomer'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'share',
                        child: Text(
                          'Partager',
                        ),
                      ),
                      const PopupMenuItem<String>(
                        value: 'delete',
                        child: Text(
                          'Supprimer',
                        ),
                      ),
                    ];
                  },
                ),
                subtitle: Text('Catégorie: ${folder['category']}'),
                onTap: () {
                  // Action lors de la sélection du dossier (par exemple, afficher les fichiers)
                  print('hello');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FileListPage(
                                name: folder['name'],
                                id: folders[index].id,
                              )));
                },
              );
            },
          );
        },
      ),
    );
  }

  void _showModifyFolderModal(BuildContext context,
      TextEditingController _folderNameController, String id) {
    showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // Pour permettre à la modal de prendre plus d'espace
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets, // Gérer le clavier
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Nouveau nom',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _folderNameController,
                  decoration: const InputDecoration(
                    labelText: 'Nom du Document',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                BottonContinuer2(
                    size: MediaQuery.of(context).size,
                    press: () {
                      if (_folderNameController.text.isNotEmpty &&
                          _folderNameController.text != '') {
                        _updateFolderName(
                            context, id, _folderNameController.text);
                        Navigator.pop(context);
                      } else {
                        // Afficher un message d'erreur si le formulaire est incomplet
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              backgroundColor: Colors.red,
                              content:
                                  Text('Veuillez remplir tous les champs')),
                        );
                      }
                    },
                    name: 'Enregistrer')
              ],
            ),
          ),
        );
      },
    );
  }
}

void _showDeleteFolder(BuildContext context, String id, String name) {
  showModalBottomSheet(
    context: context,
    isScrollControlled:
        true, // Pour permettre à la modal de prendre plus d'espace
    builder: (BuildContext context) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets, // Gérer le clavier
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Supprimer le document $name',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: BottonContinuer2(
                        size: MediaQuery.of(context).size,
                        press: () {
                          _deleteFolder(context, id);
                          Navigator.pop(context);
                        },
                        name: 'Oui'),
                  ),
                  Expanded(
                    child: BottonContinuer2(
                        size: MediaQuery.of(context).size,
                        color: Colors.red,
                        press: () {
                          Navigator.pop(context);
                        },
                        name: 'NON'),
                  )
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}

void _deleteFolder(BuildContext context, String folderId) async {
  try {
    await FirebaseFirestore.instance
        .collection('folder')
        .doc(folderId)
        .delete();

    // Affiche un message de succès
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Dossier supprimé avec succès')),
    );
  } catch (e) {
    // Affiche un message d'erreur
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Erreur lors de la suppression: $e')),
    );
  }
}

void _updateFolderName(
    BuildContext context, String folderId, String newName) async {
  try {
    await FirebaseFirestore.instance
        .collection('folder')
        .doc(folderId)
        .update({'name': newName}); // Met à jour le nom du dossier

    // Affiche un message de succès
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Nom du dossier mis à jour avec succès')),
    );
  } catch (e) {
    // Affiche un message d'erreur
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Erreur lors de la mise à jour: $e')),
    );
  }
}
