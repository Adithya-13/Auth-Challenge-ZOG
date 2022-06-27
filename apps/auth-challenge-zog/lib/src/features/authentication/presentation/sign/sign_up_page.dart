import 'package:auth_challenge_zog/auth_challenge_zog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'Default', type: SignUpPage)
Widget signUpPage(BuildContext context) {
  return const SignUpPage();
}

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  static const imageKey = Key(Keys.imageIcon);
  static const usernameKey = Key(Keys.usernameTextField);
  static const emailKey = Key(Keys.emailTextField);
  static const passwordKey = Key(Keys.passwordTextField);
  static const signUpButtonKey = Key(Keys.signUpButton);
  static const signInTextKey = Key(Keys.signInText);
  static const termsAndPrivacy = Key(Keys.termsAndPrivacy);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.blue,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.p20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: Sizes.p32,
                      color: AppThemes.white,
                    ),
                  ),
                  gapW20,
                  Text(
                    'Sign Up.',
                    style: AppThemes.headline1,
                  ),
                ],
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
                  child: const SignUpForm()),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpForm extends ConsumerStatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SignUpForm> {
  late final TextEditingController _usernameController =
      TextEditingController();
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _node = FocusScopeNode();

  String get username => _usernameController.text;
  String get email => _emailController.text;
  String get password => _passwordController.text;

  void _back() {
    context.pop();
  }

  void _onSubmit(SignUpValidationProvider formProvider) {
    showSnackBar(context, 'Sign up Successful!');
    context.goNamed(AppRoute.signIn.name, queryParams: {
      Keys.username: username,
    });
  }

  @override
  void dispose() {
    _node.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formProvider = ref.watch(signUpValidationProvider);

    return FocusScope(
      node: _node,
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              gapH20,
              const AppIconWidget(
                key: SignUpPage.imageKey,
              ),
              gapH16,
              CustomTextFormField(
                key: SignUpPage.usernameKey,
                controller: _usernameController,
                title: 'Username',
                hintText: 'username',
                keyboardType: TextInputType.name,
                onChanged: formProvider.validateUsername,
                errorText: formProvider.username.error,
              ),
              gapH12,
              CustomTextFormField(
                key: SignUpPage.emailKey,
                controller: _emailController,
                title: 'E-mail',
                hintText: 'example@gmail.com',
                keyboardType: TextInputType.emailAddress,
                onChanged: formProvider.validateEmail,
                errorText: formProvider.email.error,
              ),
              gapH12,
              CustomTextFormField(
                key: SignUpPage.passwordKey,
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
              CheckboxListTile(
                key: SignUpPage.termsAndPrivacy,
                value: formProvider.isChecked,
                onChanged: formProvider.onCheckboxChanged,
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('I agree with ', style: AppThemes.subText1),
                    GestureDetector(
                      onTap: () {},
                      child: Text('Terms ', style: AppThemes.subText1.blue),
                    ),
                    Text('and ', style: AppThemes.subText1),
                    GestureDetector(
                      onTap: () {},
                      child: Text('Privacy', style: AppThemes.subText1.blue),
                    ),
                  ],
                ),
              ),
              gapH20,
              PrimaryButton(
                key: SignUpPage.signUpButtonKey,
                text: 'Sign Up',
                onPressed: formProvider.validate
                    ? () => _onSubmit(formProvider)
                    : null,
              ),
              gapH64,
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('I\'m already an account ? ',
                        style: AppThemes.subText1),
                    GestureDetector(
                      key: SignUpPage.signInTextKey,
                      onTap: _back,
                      child:
                          Text('Sign In', style: AppThemes.subText1.blue.bold),
                    ),
                  ],
                ),
              ),
              gapH48,
            ],
          ),
        ),
      ),
    );
  }
}
