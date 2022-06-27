import 'package:auth_challenge_zog/auth_challenge_zog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:auth_challenge_zog/main.dart' as app;

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('sign up test', () {
    
    testWidgets('fill the textfield, tap terms and privacy, and then sign up', (tester) async {
      
      //initialize app main()
      app.main();

      //rebuild frame
      await tester.pumpAndSettle();

      //check if sign in widget its exist
      expect(find.byKey(SignInPage.imageKey), findsOneWidget);
      expect(find.byKey(SignInPage.usernameKey), findsOneWidget);
      expect(find.byKey(SignInPage.passwordKey), findsOneWidget);
      expect(find.byKey(SignInPage.rememberMeKey), findsOneWidget);
      expect(find.byKey(SignInPage.signInButtonKey), findsOneWidget);
      expect(find.byKey(SignInPage.signUpTextKey), findsOneWidget);

      //tap the signUp text button
      await tester.tap(find.byKey(SignInPage.signUpTextKey));

      //rebuild frame
      await tester.pumpAndSettle();

      //check if sign up widget its exist
      expect(find.byKey(SignUpPage.imageKey), findsOneWidget);
      expect(find.byKey(SignUpPage.usernameKey), findsOneWidget);
      expect(find.byKey(SignUpPage.emailKey), findsOneWidget);
      expect(find.byKey(SignUpPage.passwordKey), findsOneWidget);
      expect(find.byKey(SignUpPage.termsAndPrivacy), findsOneWidget);
      expect(find.byKey(SignUpPage.signUpButtonKey), findsOneWidget);
      expect(find.byKey(SignUpPage.signInTextKey), findsOneWidget);

      //check if primary button is disbled and checkboxlisttile is false
      expect(tester.widget<PrimaryButton>(find.byKey(SignUpPage.signUpButtonKey)).onPressed, isNull);
      expect(tester.widget<CheckboxListTile>(find.byType(CheckboxListTile)).value, false);

      //fill the username textfield
      await tester.tap(find.byKey(SignUpPage.usernameKey));
      await tester.enterText(find.byKey(SignUpPage.usernameKey), 'Adithya13');

      //fill the email textfield
      await tester.tap(find.byKey(SignUpPage.emailKey));
      await tester.enterText(find.byKey(SignUpPage.emailKey), 'adithya13@gmail.com');

      //fill the password textfield
      await tester.tap(find.byKey(SignUpPage.passwordKey));
      await tester.enterText(find.byKey(SignUpPage.passwordKey), '234448Adit');

      //tap the terms and privacy
      await tester.tap(find.byKey(SignUpPage.termsAndPrivacy));

      //rebuild frame
      await tester.pumpAndSettle();

      //check if the filled textfield is exist
      expect(find.text('Adithya13'), findsOneWidget);
      expect(find.text('adithya13@gmail.com'), findsOneWidget);
      expect(find.text('234448Adit'), findsOneWidget);

      //tap the sign up button
      await tester.tap(find.byKey(SignUpPage.signUpButtonKey));
      
      //rebuild frame
      await tester.pumpAndSettle();

      //check if back to the sign in page
      expect(find.text('Sign In.'), findsOneWidget);
    });

  });

  group('sign in test', (){
    testWidgets('fill the textfield, and then sign in', (tester) async {
        
      //initialize app main()
      app.main();

      //rebuild frame
      await tester.pumpAndSettle();

      //check if sign in widget its exist
      expect(find.byKey(SignInPage.imageKey), findsOneWidget);
      expect(find.byKey(SignInPage.usernameKey), findsOneWidget);
      expect(find.byKey(SignInPage.passwordKey), findsOneWidget);
      expect(find.byKey(SignInPage.rememberMeKey), findsOneWidget);
      expect(find.byKey(SignInPage.signInButtonKey), findsOneWidget);
      expect(find.byKey(SignInPage.signUpTextKey), findsOneWidget);

      //check if primary button is disbled and checkboxlisttile is false
      expect(tester.widget<PrimaryButton>(find.byKey(SignInPage.signInButtonKey)).onPressed, isNull);
      expect(tester.widget<CheckboxListTile>(find.byType(CheckboxListTile)).value, false);

      //fill the username textfield
      await tester.tap(find.byKey(SignInPage.usernameKey));
      await tester.enterText(find.byKey(SignInPage.usernameKey), 'Adithya13');

      //fill the username textfield
      await tester.tap(find.byKey(SignInPage.passwordKey));
      await tester.enterText(find.byKey(SignInPage.passwordKey), '234448Adit');

      //tap remember me
      await tester.tap(find.byKey(SignInPage.rememberMeKey));

      //rebuild frame
      await tester.pumpAndSettle();
      
      //check if the filled textfield is exist
      expect(find.text('Adithya13'), findsOneWidget);
      expect(find.text('234448Adit'), findsOneWidget);

      //check if primary button is enabled
      expect(tester.widget<PrimaryButton>(find.byKey(SignInPage.signInButtonKey)).onPressed, isNotNull);

      //tap the sign up button
      await tester.tap(find.byKey(SignInPage.signInButtonKey));
      await tester.pumpAndSettle();
        
      expect(find.text('Dashboard.'), findsOneWidget);

    });
  });
}