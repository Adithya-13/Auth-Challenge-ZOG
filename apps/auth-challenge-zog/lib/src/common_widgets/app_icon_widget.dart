import 'package:auth_challenge_zog/auth_challenge_zog.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'Default', type: AppIconWidget)
Widget appIconWidget(BuildContext context) {
  return const AppIconWidget();
}
class AppIconWidget extends StatelessWidget {
  const AppIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Resources.icon,
      color: AppThemes.blue,
      width: Sizes.mqWidth(context, percentage: 0.8),
    );
  }
}
