// import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:third_project/asset/alpha.dart';
import 'package:third_project/screens/index.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _passwordtextController = TextEditingController();
  final TextEditingController _emailTextcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              hexstring("CB2B93"),
              hexstring("9546C4"),
              hexstring("5E61D4"),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 150,
                      ),
                      reuseableTextField("Enter Username", Icons.person_outline,
                          false, _emailTextcontroller),
                      const SizedBox(
                        height: 50,
                      ),
                      reuseableTextField("Enter Password", Icons.lock_outline,
                          true, _passwordtextController),
                      const SizedBox(
                        height: 30,
                      ),
                      splashButton(context, true, () {
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: _emailTextcontroller.text,
                                password: _passwordtextController.text)
                            .then((value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        }).onError((error, stackTrace){
                          // print("Error ${error.toString()}");
                      });
                      signUpOption();
                      })
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Dont have account?", style: TextStyle(color: Colors.blue)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUp()));
          },
          child: const Text(
            "  Sign Up",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
