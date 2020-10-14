import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutButton extends StatefulWidget {

  @override
  _LogoutButtonState createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  void _postLogout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("auth", null);
    Navigator.pushReplacementNamed(context, '/main');
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
      icon: Icon(FontAwesome5Solid.sign_out_alt),
      label: Text("Keluar"),
      elevation: 0,
      onPressed: () {
        return showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Logout ?'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Aksi ini akan mengeluarkan akun anda dari aplikasi.'),
                    Text('Apakah anda ingin melakukan logout?'),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    _postLogout(context);
                  },
                ),
                FlatButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}