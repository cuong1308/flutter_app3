import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  LogInPage({Key? key}) : super(key: key);
  var _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Vui long nhap ten dang nhap";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text("Ten dang nhap"),
                  hintText: "vui long nhap ten dang nhap",
                  prefix: Icon(Icons.person),
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text("Mat khau"),
                  hintText: "vui long nhap mat khau",
                  prefix: Icon(Icons.key),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
