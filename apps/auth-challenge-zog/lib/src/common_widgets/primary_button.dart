import 'package:auth_challenge_zog/auth_challenge_zog.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'Enabled', type: PrimaryButton)
Widget enabledPrimaryButton(BuildContext context) {
  return PrimaryButton(
    text: 'Login',
    onPressed: (){},
  );
}

@WidgetbookUseCase(name: 'Disabled', type: PrimaryButton)
Widget disabledPrimaryButton(BuildContext context) {
  return const PrimaryButton(
    text: 'Login',
  );
}

@WidgetbookUseCase(name: 'Long Text', type: PrimaryButton)
Widget longTextPrimaryButton(BuildContext context) {
  return PrimaryButton(
    text: 'Login with \nAuthentication',
    onPressed: (){},
  );
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key? key, required this.text, this.isLoading = false, this.onPressed})
      : super(key: key);
  final String text;
  final bool isLoading;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: AppThemes.white,
          primary: AppThemes.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sizes.p12),
          ),
          padding: const EdgeInsets.all(Sizes.p12),
        ),
        onPressed: onPressed,
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                text,
                textAlign: TextAlign.center,
                style: AppThemes.text1.white,
              ),
      ),
    );
  }
}
