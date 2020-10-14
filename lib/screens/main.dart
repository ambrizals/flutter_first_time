import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    execute(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            CircularProgressIndicator(),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                child: Text("Mohon tunggu sebentar sedang memuat data")
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }

  Future<void> execute(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final auth = prefs.getString("auth") ?? null;
    if(auth != null) {
      Navigator.pushReplacementNamed(context, '/checkAuth');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }
}
