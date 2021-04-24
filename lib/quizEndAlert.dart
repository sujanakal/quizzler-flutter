import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void showAlert(BuildContext context) {
  Alert(
    context: context,
    title: "That Is All!",
    type: AlertType.info,
    //image: Image.asset('images/complain.png'),
    style: AlertStyle(
      backgroundColor: Colors.grey.shade800,
      titleStyle: TextStyle(
        fontFamily: 'Comfortaa',
        color: Colors.white,
      ),
      descStyle: TextStyle(
        fontFamily: 'Comfortaa',
        color: Colors.white,
      ),
    ),
    desc: "Quiz Ended...\n",
    buttons: [
      DialogButton(
        color: Colors.grey[900],
        child: Text(
          'OK',
          style: TextStyle(
            fontFamily: 'Comfortaa',
            color: Colors.white,
          ),
        ),
        onPressed: () => {
          Navigator.of(context).pop(),
        },
      ),
    ],
  ).show();
}
