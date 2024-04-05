import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/model/user.dart';
import 'package:shopping_cart/ui/widgets/login_form.dart';
import 'package:shopping_cart/ui/widgets/registration_form.dart';

final _firebase = FirebaseAuth.instance;

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late Widget activeWidget;
  String selectedForm = "login";

  void _switchForm(String selection) {
    setState(() {
      selectedForm = selection;
    });
  }

  void onLogin({required String email, required String password}) async {
    try {
      final userCredentials = await _firebase.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(userCredentials);
    } on FirebaseAuthException catch (error) {
      print(error.code);
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Authentication failed!")));
    }
  }

  void register(UserData user) async {
    try {
      final userCredential = await _firebase.createUserWithEmailAndPassword(
          email: user.email, password: user.password);

      user.id = userCredential.user!.uid;
      // Save user on firestore;
    } on FirebaseAuthException catch (err) {
      if (kDebugMode) {
        print(err);
      }
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Registration failed: ${err.code}"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (selectedForm == "login") {
      activeWidget = LoginForm(
        onFormSwitch: _switchForm,
        onLogin: onLogin,
      );
    } else if (selectedForm == "registration") {
      activeWidget = RegistrationForm(onFormSwitch: _switchForm, onSave: register,);
    }
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Stack(children: [
          Card(
            color: Theme.of(context).colorScheme.background,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  activeWidget,
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      selectedForm == "login"
                          ? const Text("Non sei registrato?")
                          : const Text("Sei già un utente?"),
                      TextButton(
                          onPressed: () {
                            _switchForm(selectedForm == "login"
                                ? "registration"
                                : "login");
                          },
                          child: selectedForm == "login"
                              ? const Text("Registrati!")
                              : const Text("Accedi!"))
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Positioned(top: 100, left: 100, child: CircularProgressIndicator())
        ]),
      ),
    );
  }
}
