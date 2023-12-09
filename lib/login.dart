import 'dart:js';

import 'package:activites_management/composant/widget.dart';
import 'package:activites_management/home.dart';
import 'package:activites_management/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginEcran extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _signInWithEmailAndPassword(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
      _showSuccessToast("Authentification réussie");
    } catch (e) {
      print('Erreur de connexion: $e');
      _showErrorToast("Erreur de connexion");
    }
  }

  void _showSuccessToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void _showErrorToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF87CEEB),
              Color(0xFFADD8E6),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              MediaQuery.of(context).size.height * 0.1,
              20,
              0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Bienvenue dans ServiPro",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                //Image(image: AssetImage('assets/images/login.jpg')),
                ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image(image: AssetImage('assets/images/login.jpg'))),
                SizedBox(height: 30),
                composantTextField(
                  "Entrer votre login",
                  Icons.person_outline,
                  false,
                  emailController,
                ),
                SizedBox(height: 20),
                composantTextField(
                  "Entrer votre Mot de passe",
                  Icons.lock_outline,
                  true,
                  passwordController,
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () async {
                    await _signInWithEmailAndPassword(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.blue), // Couleur de fond du bouton
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white), // Couleur du texte du bouton
                    // Vous pouvez ajouter d'autres propriétés ici selon vos besoins
                  ),
                  child: Text('Se connecter'),
                ),
                signUpOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Vous n'avez pas de compte?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context as BuildContext,
              MaterialPageRoute(builder: (context) => SignUp()),
            );
          },
          child: const Text(
            "S'inscrire",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
