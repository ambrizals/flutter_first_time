import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: double.infinity,
      child: RaisedButton.icon(
        icon: SizedBox(
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
            strokeWidth: 2,
          ),
          width: 16,
          height: 16,
        ),
        elevation: 0,
        color: Colors.blue,
        label: Text("Mohon Tunggu Sebentar", style: TextStyle(color: Colors.white)),
        onPressed: () {
          return null;
        },
      ),
    );
  }
}