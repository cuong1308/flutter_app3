import 'package:flutter/material.dart';

class LogIn extends StatelessWidget {
  LogIn({Key? key}) : super(key: key);
  var _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                validator: (value){
                  if (value == null || value.isEmpty)
                    return "Vui long nhap ten dang nhap";
                  else if(value.length <5)
                    return "Ten dang nhap qua ngan";
                  return null;
                },
                decoration: InputDecoration(
                  label: Text("Ten dang nhap"),
                  hintText: "Vui long nhap ten dang nhap",
                  prefix: Icon(Icons.person)
                ),
              ),
              ElevatedButton(
                  onPressed: (){
                    if(_formkey.currentState!.validate()){

                    }
                    else {

                    }
                  },
                  child: Text("Ok")
              )
            ],
          ),
        ),
      ),
    );
  }
}
