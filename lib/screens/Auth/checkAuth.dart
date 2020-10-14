import 'package:bbd_apps/logic/Auth/Authentication.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class CheckAuthScreen extends StatefulWidget {
  @override
  _CheckAuthScreenState createState() => _CheckAuthScreenState();
}

class _CheckAuthScreenState extends State<CheckAuthScreen> {
  // bool isOffline = false, internetCheck = false;
  Map connectivityStatus = {
    "isOffline": false,
    "internetCheck": false
  };

  List<Widget> widgetContainer(BuildContext context) {
    if (connectivityStatus["internetCheck"]) {
      return [
        CircularProgressIndicator(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
          child: Text("Sedang memeriksa autentikasi")
        ),
      ];
    } else {
      return [
        CircularProgressIndicator(),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
            child: Text("Sedang memeriksa koneksi internet")
        ),
      ];
    }
  }

  @override
  void dispose() {
    super.dispose();
    widgetContainer(context);
  }

  @override
  void initState() {
    super.initState();
    firstExecute(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: widgetContainer(context),
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }

  Future<void> firstExecute(BuildContext context) async {
    WidgetsFlutterBinding.ensureInitialized();
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.none) {
      setState(() {
        connectivityStatus = {
          ...connectivityStatus,
          "internetCheck": true,
          "isOffline": false
        };
      });
    } else {
      setState(() {
        connectivityStatus = {
          ...connectivityStatus,
          "internetCheck": true,
          "isOffline": true
        };
      });
    }
    execute(context);

  }

  Future<void> execute(BuildContext context) async {
    final checkAuth = await AuthenticationLogic().checkLogin();
    if(checkAuth != 401) {
      Navigator.pushReplacementNamed(context, '/dashboard');
    }
    else if(checkAuth == 'SocketException') {
      Navigator.pushReplacementNamed(context, '/dashboard');
    }
    else {
      await AuthenticationLogic().removeAuth();
      Navigator.pushReplacementNamed(context, '/login');
    }
  }
}
