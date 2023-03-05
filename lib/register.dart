import 'package:flutter/material.dart';
import 'package:flutter_sample/home.dart';

class ScreenRegister extends StatelessWidget {
  ScreenRegister({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Form(
            key: _formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextFormField(
                    controller: _firstNameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "First Name"),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'first name required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _lastNameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "Last Name"),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'last name required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "Password"),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'password required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Confirm password"),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'confirm password required';
                        if(value != _passwordController.text){
                          return "password not matching";
                        }
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        register(context);
                      }
                    },
                    child: const Text('Register'),
                  )
                ]),
          ),
        ),
      ),
    );
  }

  void register(BuildContext ctx){
    
    final first = _firstNameController.text;
    final last = _lastNameController.text;
    final pass = _passwordController.text;
    final conf = _confirmPasswordController.text;

    print("register");
    print("first name: $first");
    print("last name: $last");
    print("password: $pass");
    print("confirm: $conf");

    Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (ctx)=> ScreenHome()));
  }
}
