import 'package:firebasetutorial/screens/services/auth.dart';
import 'package:firebasetutorial/shared/constants.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();

}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  // text field state
  String email = '';
  String password = '';
  final _formkey = GlobalKey<FormState>();
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign In'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(Icons.person),
            label: Text('Register'),),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
            key: _formkey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField( //username field
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val.isEmpty ? 'Enter an email': null,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(height: 20.0),
              TextFormField( //password field
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                validator: (val) => val.isEmpty ? 'Enter a password 6+ char long': null,
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },

              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.blue[900],
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formkey.currentState.validate()){
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() {
                        error = 'Invalid Credentials: Username or Password incorrect';
                      });
                    }
                  }
                },
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          )
        ),
      )
    );
  }
}
