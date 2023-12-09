import 'package:activites_management/composant/widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'; // Importez Fluttertoast

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _usernameTextController = TextEditingController();

  // Ajoutez une fonction pour gérer l'inscription
  void _signUp() {
    String username = _usernameTextController.text;
    String email = _emailTextController.text;
    String password = _passwordTextController.text;

    // Vous pouvez ajouter ici la logique pour traiter l'inscription
    // (envoyer des données au serveur, enregistrer dans une base de données, etc.)

    // Affichez un toast pour indiquer que l'inscription n'est pas encore implémentée
    Fluttertoast.showToast(
      msg: "L'inscription n'est pas encore implémentée",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.orange,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Créer un compte",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
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
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                composantTextField(
                  "Entrer votre Nom",
                  Icons.person_outline,
                  false,
                  _usernameTextController,
                ),
                const SizedBox(
                  height: 20,
                ),
                composantTextField(
                  "Entrer votre login",
                  Icons.person_outline,
                  false,
                  _emailTextController,
                ),
                SizedBox(
                  height: 20,
                ),
                composantTextField(
                  "Entrer votre mot de passe",
                  Icons.lock_outline,
                  true,
                  _passwordTextController,
                ),
                // Utilisez la fonction _signUp pour gérer l'inscription

                signUpOption()
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
            // Naviguer vers la page de création de compte (SignUp)
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUp()),
            );
          },
          child: const Text(
            "S'inscrire",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
