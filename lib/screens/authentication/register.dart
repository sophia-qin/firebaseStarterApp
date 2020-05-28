import 'package:firebasetutorial/screens/services/auth.dart';
import 'package:firebasetutorial/shared/constants.dart';
import 'package:firebasetutorial/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  // text field state
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading ? Loading(): Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.blue[400],
          elevation: 0.0,
          title: Text('Register'),
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text('Sign In'),),
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
                    validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long': null,
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
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formkey.currentState.validate()){
                        setState(() {
                          loading = true;
                        });
                        dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                        if (result == null) {
                          setState(() {
                            error = 'Please supply a vaid email';
                            loading = false;
                          });
                        }
                      } else {

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
