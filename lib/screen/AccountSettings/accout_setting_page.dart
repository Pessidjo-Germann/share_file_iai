import 'package:flutter/material.dart';

class AccountSettingsPage extends StatefulWidget {
  @override
  _AccountSettingsPageState createState() => _AccountSettingsPageState();
}

class _AccountSettingsPageState extends State<AccountSettingsPage> {
  // Controllers for text fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // TODO: Initialize fields with actual user data
    _emailController.text = 'user@example.com';  // Fetch current email
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paramètres de Compte'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section pour le changement d'email
            Text(
              'Changer l\'Email',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Nouvel Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implémenter la logique de mise à jour de l'email
                print('Email mis à jour: ${_emailController.text}');
              },
              child: Text('Mettre à jour l\'email'),
            ),

            SizedBox(height: 30),

            // Section pour le changement de mot de passe
            Text(
              'Changer votre nom',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
            
              decoration: InputDecoration(
                labelText: 'Nouveau nom',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implémenter la logique de mise à jour du mot de passe
                print('Mot de passe mis à jour');
              },
              child: Text('Mettre à jour le mot de passe'),
            ),

            SizedBox(height: 30),

            // Bouton pour se déconnecter
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Background color
              ),
              onPressed: () {
                // TODO: Implémenter la logique de déconnexion
                print('Déconnexion');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.logout),
                  SizedBox(width: 10),
                  Text('Déconnexion'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
