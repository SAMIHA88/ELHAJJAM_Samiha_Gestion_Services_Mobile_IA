import 'package:flutter/material.dart';
import 'package:gestion_activites/composants/widget.dart';
import 'package:gestion_activites/utils/colors_utils.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _passwordTextConttroller = TextEditingController();
  TextEditingController _emailTextConttroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringToColor("CD2B93"),
            hexStringToColor("9546C4"),
            hexStringToColor("5E61F4")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  20, MediaQuery.of(context).size.height * 0.2, 20, 0),
              child: Column(
                children: <Widget>[
                  logoWidget("assets/images/login.jpg"),
                  SizedBox(
                    height: 30,
                  ),
                  composantTextField("Entrez votre login",
                      Icons.person_2_outlined, false, _emailTextConttroller),
                  SizedBox(
                    height: 30,
                  ),
                  composantTextField("Entrez votre Mot de Passe",
                      Icons.lock_outline, true, _passwordTextConttroller),
                ],
              ),
            ),
          )),
    );
  }
}


