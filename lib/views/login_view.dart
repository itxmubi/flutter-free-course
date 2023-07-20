import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: FutureBuilder(
          future: Firebase.initializeApp(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return Column(children: [
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        hintText: "Enter your Email here"),
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    autocorrect: false,
                    decoration: const InputDecoration(
                        hintText: "Enter your password here"),
                  ),
                  TextButton(
                    onPressed: () async {
                      final email = emailController.text;
                      final password = passwordController.text;
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: email, password: password);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == "user-not-found") {
                          print("user not foundd");
                        }
                      }
                    },
                    child: const Text("Login"),
                  )
                ]);
              default:
                return const Text("Loading....");
            }
          }),
    );
  }
}
