import 'package:flutter/material.dart';
import 'package:shopping_cart/model/user.dart';
import 'package:shopping_cart/shared/validators.dart';

final kRegFormKey = GlobalKey<FormState>();

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key, required this.onFormSwitch, required this.onSave});

  final void Function(String selection) onFormSwitch;
  final void Function(UserData user) onSave;

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  String _enteredLastname = "";

  String _enteredFirstname = "";

  String _enteredEmail = "";

  String _enteredPassword = "";

  void _saveRegForm() {
    if (kRegFormKey.currentState!.validate()) {
      kRegFormKey.currentState!.save();
    }
    UserData user = UserData(
      email: _enteredEmail,
      password: _enteredPassword,
      lastname: _enteredLastname,
      firstname: _enteredFirstname,
      isVendor: false,
    );
    widget.onSave(user);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: kRegFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(label: Text("Lastname")),
            maxLength: 30,
            keyboardType: TextInputType.text,
            validator: validateLastname,
            onSaved: (value) => {_enteredLastname = value!},
          ),
          TextFormField(
            decoration: const InputDecoration(label: Text("Firstname")),
            maxLength: 30,
            keyboardType: TextInputType.text,
            validator: validateFirstname,
            onSaved: (value) => {_enteredFirstname = value!},
          ),
          TextFormField(
            decoration: const InputDecoration(label: Text("Email")),
            autocorrect: false,
            maxLength: 100,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.emailAddress,
            validator: validateEmail,
            onSaved: (value) => {_enteredEmail = value!},
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: const InputDecoration(label: Text("Password")),
            obscureText: true,
            maxLength: 100,
            enableSuggestions: false,
            keyboardType: TextInputType.text,
            validator: validatePassword,
            onSaved: (value) => {_enteredPassword = value!},
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                  onPressed: () {
                    kRegFormKey.currentState!.reset();
                  },
                  child: const Text("Reset")),
              const SizedBox(width: 4),
              ElevatedButton(
                onPressed: _saveRegForm,
                child: const Text("Register"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
