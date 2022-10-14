import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:third_project/asset/alpha.dart';
import 'index.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextcontroller = TextEditingController();
  final TextEditingController _phoneTextcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "    Sign Up",
          style: TextStyle(fontSize: 29, fontWeight: FontWeight.w800),
        ),
      ),
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
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 100,
                      ),
                      reuseableTextField("Enter Username", Icons.person_outline,
                          false, _emailTextcontroller),
                      const SizedBox(
                        height: 50,
                      ),
                      reuseableTextField("Enter Phone number",
                          Icons.lock_outline, false, _phoneTextcontroller),
                      const SizedBox(
                        height: 30,
                      ),
                      reuseableTextField("Enter password", Icons.person_outline,
                          true, _passwordTextController),
                      const SizedBox(
                        height: 50,
                      ),
                      splashButton(context, false, () {
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: _emailTextcontroller.text,
                                password: _passwordTextController.text)
                            .then((value) {
                          // print("Created New Account");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        }).onError((error, stackTrace){
                          // print("Error ${error.toString()}");
                        });
                      })
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
