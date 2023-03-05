import 'package:flutter/material.dart';
import 'package:flutter_sample/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ScreenSplash(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
            width: double.infinity,
            height: 700,
            alignment: Alignment.center,
            padding: EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [RegistrationForm()],
            ),
          )
    );
  }
}


class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  String _firstName = "hggghh";
  String _lastName = "";
  String _password = "";
  String _confirmPassword = "";

  void _submitForm() {
    if(_formKey.currentState != null) {
      // if(_formKey.currentState.validate()) {
        // Form is valid, do registration logic here
        print('Registration successful!');
        print('First Name: $_firstName');
        print('Last Name: $_lastName');
        print('Password: $_password');
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'First Name',
            ),
            validator: (value) {
              if (value != null && value.isEmpty) {
                return 'Please enter your first name';
              }
              return null;
            },
            onSaved: (value) {
              print(value);
              if(value != null) {
                setState((){_firstName = value;});
                _firstName = value;
              }
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Last Name',
            ),
            obscureText: true,
            validator: (value) {
              if (value != null && value.isEmpty) {
                return 'Please enter your last name';
              }
              return null;
            },
            onSaved: (value) {
              if(value != null)
                _lastName = value;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Password',
            ),
            obscureText: true,
            validator: (value) {
              if (value != null && value.isEmpty) {
                return 'Please enter a password';
              }
              // if (value.length < 6) {
              //   return 'Password must be at least 6 characters';
              // }
              return null;
            },
            onSaved: (value) {
              if(value != null)
                _password = value;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Confirm Password',
            ),
            obscureText: true,
            validator: (value) {
              if (value != null && value.isEmpty) {
                return 'Please confirm your password';
              }
              if (value != _password) {
                return 'Passwords do not match';
              }
              return null;
            },
            onSaved: (value) {
              if(value != null){
                _confirmPassword = value;
              }
            },
          ),
          SizedBox(height: 26.0, width: 50,),
          Center(
            child: RaisedButton(
              onPressed: _submitForm,
              child: Text('Register'),
              color: Colors.blue,
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}


