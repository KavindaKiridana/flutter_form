import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            children: [
              _buildNameField(),
              _buildEmailField(),
              SizedBox(height: 300),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      print("Username: $username");
                    }
                  },
                  child: const Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String? username;
String? email;

Widget _buildNameField() {
  return TextFormField(
    decoration: InputDecoration(hintText: 'name'),
    maxLength: 20,
    maxLines: 3,
    validator: (text) {
      if (text == null || text.isEmpty) {
        return "name can't be null";
      }
      return null;
    },
    onSaved: (newValue) {
      username = newValue;
    },
  );
}

Widget _buildEmailField() {
  return TextFormField(
    decoration: InputDecoration(hintText: 'email'),
    maxLength: 20,
    maxLines: 3,
    validator: (text) {
      if (text == null || text.isEmpty) {
        return "email can't be null";
      }
      return null;
    },
    onSaved: (newValue) {
      email = newValue;
    },
  );
}
