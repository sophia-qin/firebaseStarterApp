import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasetutorial/models/brew.dart';
import 'package:firebasetutorial/screens/home/settings_form.dart';
import 'package:firebasetutorial/screens/services/auth.dart';
import 'package:firebasetutorial/screens/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'brew_list.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm()
            );
          });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          title: Text('Home Page'),
          backgroundColor: Colors.blue[300],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text('Logout')),
            FlatButton.icon(
                onPressed: () {
                  _showSettingsPanel();
                },
                icon: Icon(Icons.settings),
                label: Text("Settings"))
          ]
        ),
        body: BrewList(),
      ),
    );
  }
}
