import 'package:auth_challenge_zog/auth_challenge_zog.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  final snackBar = SnackBar(
    content: Text(
      text,
      style: AppThemes.text1.white,
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void hideSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
}
