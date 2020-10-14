import 'package:bbd_apps/components/Login/LoadingButton.dart';
import 'package:bbd_apps/logic/Auth/Authentication.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_icons/flutter_icons.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState () => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String username, password;
  bool isLoading = false;
  final _loginFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _viewKey = new GlobalKey<ScaffoldState>();

  FocusNode usernameNode = FocusNode();
  FocusNode passwordNode = FocusNode();

  Widget _buttonLogin (BuildContext context) {
    if (isLoading) {
      return LoadingButton();
    } else {
      return Row(
        children: [
          Expanded(
            child: RaisedButton.icon(
              icon: Icon(FontAwesome5Solid.sign_in_alt, color: Colors.white, size: 14),
              elevation: 0,
              color: Colors.green,
              label: Text('Login', style: TextStyle(color: Colors.white)),
              onPressed: () => {
                _postLogin(context)
              },
            ),
          ),
          Padding(padding: EdgeInsets.all(5)),
          Expanded(
              child: RaisedButton.icon(
                icon: Icon(FontAwesome5Solid.history, size: 14),
                elevation: 0,
                label: Text('Reset'),
                onPressed: () {
                  _loginFormKey.currentState.reset();
                },
              )
          )
        ],
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _buttonLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _viewKey,
      body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child:  Column(
              children: [
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Icon(Icons.vpn_key),
                        title: Text("Login"),
                        subtitle: Text("Silahkan ID dan Password untuk melanjutkan"),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Column(
                          children: [
                            Form(
                                key: _loginFormKey,
                                child: Column(children: [
                                  TextFormField(
                                    focusNode: usernameNode,
                                    decoration: InputDecoration(
                                      labelText: "Username",
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Username wajib di isi';
                                      }
                                      return null;
                                    },
                                    onSaved: (String value) {
                                      username = value;
                                    },
                                    onEditingComplete: () => {
                                      FocusScope.of(context).requestFocus(passwordNode)
                                    },
                                  ),
                                  TextFormField(
                                    focusNode: passwordNode,
                                    decoration: InputDecoration(
                                        labelText: "Password"
                                    ),
                                    obscureText: true,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Password wajib di isi';
                                      }
                                      return null;
                                    },
                                    onSaved: (String value){
                                      password = value;
                                    },
                                    onEditingComplete: ()  {
                                      _postLogin(context);
                                    },
                                  ),
                                ])
                            ),
                            Padding(padding: EdgeInsets.all(10)),
                            _buttonLogin(context)
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          )
      ),
    );
  }

  void _postLogin(BuildContext context) async {
    final FormState form = _loginFormKey.currentState;
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      _viewKey.currentState.showSnackBar(SnackBar(content: Text('Koneksi internet tidak terdeteksi, pastikan anda terhubung ke internet')));
    } else {
      if (form.validate()) {
        setState(() {
          isLoading = true;
        });
        form.save();
        final auth = await AuthenticationLogic().postLogin(username, password);
        setState(() {
          isLoading = false;
        });
        if (auth == 200) {
          Navigator.pushReplacementNamed(context, '/checkAuth');
        } else {
          _viewKey.currentState.showSnackBar(SnackBar(content: Text('Username atau Password Yang Anda Masukkan Salah !')));
        }
      }
    }
  }
}