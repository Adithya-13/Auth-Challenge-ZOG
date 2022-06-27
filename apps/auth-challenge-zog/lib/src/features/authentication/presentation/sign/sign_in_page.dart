import 'package:auth_challenge_zog/auth_challenge_zog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';


@WidgetbookUseCase(name: 'Default', type: SignInPage)
Widget signInPage(BuildContext context) {
  return const SignInPage();
}

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);
  
  static const imageKey = Key(Keys.imageIcon);
  static const usernameKey = Key(Keys.usernameTextField);
  static const passwordKey = Key(Keys.passwordTextField);
  static const signInButtonKey = Key(Keys.signInButton);
  static const signUpTextKey = Key(Keys.signUpText);
  static const rememberMeKey = Key(Keys.rememberMe);

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
                'Sign In.',
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
                child: const SignInForm(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignInForm extends ConsumerStatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => SignInFormState();
}

class SignInFormState extends ConsumerState<SignInForm> {
  late final TextEditingController _usernameController =
      TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _node = FocusScopeNode();

  String get username => _usernameController.text;
  String get password => _passwordController.text;

  void _onSubmit(SignInValidationProvider formProvider) {
    showSnackBar(context, 'Sign in Successful!');
    context.goNamed(AppRoute.dashboard.name, queryParams: {
      Keys.username: username,
    });
  }

  @override
  void dispose() {
    _node.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formProvider = ref.watch(signInValidationProvider);

    return FocusScope(
      node: _node,
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              gapH20,
              const AppIconWidget(key: SignInPage.imageKey),
              gapH16,
              CustomTextFormField(
                key: SignInPage.usernameKey,
                controller: _usernameController,
                title: 'Username',
                hintText: 'username',
                keyboardType: TextInputType.name,
                onChanged: formProvider.validateUsername,
                errorText: formProvider.username.error,
              ),
              gapH12,
              CustomTextFormField(
                key: SignInPage.passwordKey,
                controller: _passwordController,
                title: 'Password',
                hintText: 'at least 8 characters',
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.visiblePassword,
                isObscure: formProvider.isObscure,
                onObscureTap: formProvider.onObscureTap,
                onChanged: formProvider.validatePassword,
                errorText: formProvider.password.error,
              ),
              gapH8,
              Row(
                children: [
                  Expanded(
                    child: CheckboxListTile(                      
                      key: SignInPage.rememberMeKey,
                      value: formProvider.isChecked,
                      onChanged: formProvider.onCheckboxChanged,
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text('Remember me', style: AppThemes.subText1),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text('Forgot Password?',
                        style: AppThemes.subText1.blue),
                  ),
                ],
              ),
              gapH20,
              PrimaryButton(
                key: SignInPage.signInButtonKey,
                text: 'Sign In',
                onPressed: formProvider.validate
                    ? () => _onSubmit(formProvider)
                    : null,
              ),
              gapH64,
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Don\'t have an account ? ',
                        style: AppThemes.subText1),
                    GestureDetector(
                      key: SignInPage.signUpTextKey,
                      onTap: () => context.pushNamed(AppRoute.signUp.name),
                      child:
                          Text('Sign Up', style: AppThemes.subText1.blue.bold),
                    ),
                  ],
                ),
              ),
              gapH20,
            ],
          ),
        ),
      ),
    );
  }
}
