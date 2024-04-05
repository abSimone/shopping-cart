import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/shared/validators.dart';

final _logFormKey = GlobalKey<FormState>();


class LoginForm extends StatefulWidget {
  const LoginForm({super.key, required this.onFormSwitch, required this.onLogin});

  final void Function(String selection) onFormSwitch;
  final void Function({required String email, required String password}) onLogin;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String _enteredPassword = "";

  String _enteredEmail = "";


  void _login() async {
    if (_logFormKey.currentState!.validate()) {
      _logFormKey.currentState!.save();
    }
    widget.onLogin(email : _enteredEmail, password: _enteredPassword);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _logFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(label: Text("Email")),
            // maxLength: 30,
            validator: validateEmail,
            onSaved: (value) {
              _enteredEmail = value!;
            },
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: const InputDecoration(label: Text("Password")),
            // maxLength: 30,
            obscureText: true,
            keyboardType: TextInputType.text,
            onSaved: (value) {
              _enteredPassword = value!;
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: _login, child: const Text("Login")),
        ],
      ),
    );
  }
}
