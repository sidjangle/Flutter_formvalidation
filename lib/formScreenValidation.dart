import 'package:flutter/material.dart';

class FormValidationScreen extends StatefulWidget {
  @override
  _FormValidationScreenState createState() => _FormValidationScreenState();
}

class _FormValidationScreenState extends State<FormValidationScreen> {
  String _name;
  String _password;
  String _emailid;
  String _mobilenumber;

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  Widget name() {
    return TextFormField(
      maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Enter the Required Field';
        }
        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
      decoration: InputDecoration(labelText: 'Enter Name'),
    );
  }

  Widget password() {
    return TextFormField(
      maxLength: 10,
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Enter the Required Field';
        }
        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
      decoration: InputDecoration(labelText: 'Password'),
    );
  }

  Widget emailid() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Enter the Required Field';
        }
        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please Enter Valid Email Id';
        }

        return null;
      },
      onSaved: (String value) {
        _emailid = value;
      },
      decoration: InputDecoration(labelText: 'Email Id'),
    );
  }

  Widget mobilenumber() {
    return TextFormField(
      maxLength: 10,
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Enter the Required Field';
        }
        return null;
      },
      onSaved: (String value) {
        _mobilenumber = value;
      },
      decoration: InputDecoration(labelText: 'mobile Number'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('FormValidation'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _globalKey,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  name(),
                  password(),
                  emailid(),
                  mobilenumber(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                        padding: EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: Colors.red,
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          if (!_globalKey.currentState.validate()) {
                            return;
                          }

                          _globalKey.currentState.save();
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
