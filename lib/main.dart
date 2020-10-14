import 'package:bbd_apps/repositories/connector.dart';
import 'package:bbd_apps/screens/Auth/checkAuth.dart';
import 'package:bbd_apps/screens/dashboard.dart';
import 'package:bbd_apps/screens/Auth/login.dart';
import 'package:flutter/material.dart';
import 'package:bbd_apps/screens/main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseConnector().initDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bang Bang Decor',
      initialRoute: '/main',
      routes: {
        // Authentication Area
        '/main': (context) => MainScreen(),
        '/login': (context) => LoginScreen(),
        '/checkAuth' : (context) => CheckAuthScreen(),
        // When Authenticated
        '/dashboard': (context) => DashboardScreen()
      }
    );
  }
}