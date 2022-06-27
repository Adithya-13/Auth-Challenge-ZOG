import 'package:auth_challenge_zog/auth_challenge_zog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'Default', type: DashboardPage)
Widget dashboardPage(BuildContext context) {
  return const DashboardPage(username: 'Adithya',);
}

@WidgetbookUseCase(name: 'Long Username', type: DashboardPage)
Widget dashboardPageLongUsername(BuildContext context) {
  return const DashboardPage(username: 'Adithya Firmansyah Putra',);
}

class DashboardPage extends StatelessWidget {
  final String username;
  const DashboardPage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.blue,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.p20),
              child: Text(
                'Dashboard.',
                style: AppThemes.headline1,
              ),
            ),
            gapH20,
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: Sizes.p20),
                decoration: const BoxDecoration(
                  color: AppThemes.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(Sizes.p24),
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Welome to Dashboard, $username',
                          style: AppThemes.headline1.black),
                      gapH20,
                      PrimaryButton(
                        text: 'Sign out',
                        onPressed: () {
                          showSnackBar(context, 'Sign out Successful!');
                          context.goNamed(AppRoute.signIn.name);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
