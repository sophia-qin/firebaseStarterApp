import 'package:firebasetutorial/shared/constants.dart';
import 'package:flutter/material.dart';


class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3'];

  //form values
  String _currentName;
  String _currentSugars;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text('Update brew settings'),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: 'Update Name'),
            validator: (val) => val.isEmpty ? 'Please enter a name' : null,
            onChanged: (val) => setState(() => _currentName = val),
          ),
          SizedBox(height: 20.0),
          DropdownButtonFormField(
            decoration: textInputDecoration,
            value: _currentSugars ?? '0', //not completeley necessary anymore
            items: sugars.map((sugar) {
              return DropdownMenuItem(
                value: sugar,
                child: Text('$sugar sugars'),
              );
            }).toList(),
            onChanged: (val) => setState(()=> _currentSugars = val),
          ),
          RaisedButton(
            color: Colors.blue,
            child: Text('Update'),
            onPressed: () async {
              print(_currentName);
              print(_currentSugars);
            },
          )
        ],
      ),
    );
  }
}
