import 'package:auth_challenge_zog/auth_challenge_zog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'Default', type: EmptyPlaceholderWidget)
Widget emptyPlaceholderWidget(BuildContext context) {
  return const EmptyPlaceholderWidget(message: '404 Not found!');
}

class EmptyPlaceholderWidget extends StatelessWidget {
  const EmptyPlaceholderWidget({Key? key, required this.message})
      : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.p16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              message,
              style: AppThemes.text1,
              textAlign: TextAlign.center,
            ),
            gapH32,
            PrimaryButton(
              onPressed: () => context.goNamed(AppRoute.signIn.name),
              text: 'Go Login Page',
            )
          ],
        ),
      ),
    );
  }
}
