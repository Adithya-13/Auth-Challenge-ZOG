import 'package:auth_challenge_zog/auth_challenge_zog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'Default', type: CustomTextFormField)
Widget defaultCustomTextFormField(BuildContext context) {
  return CustomTextFormField(
    controller: TextEditingController(),
    title: 'Username',
    hintText: 'username',
  );
}

@WidgetbookUseCase(name: 'Disabled', type: CustomTextFormField)
Widget disabledCustomTextFormField(BuildContext context) {
  return CustomTextFormField(
    controller: TextEditingController(),
    title: 'Username',
    hintText: 'username',
    enabled: false,
  );
}

@WidgetbookUseCase(name: 'Error', type: CustomTextFormField)
Widget errorCustomTextFormField(BuildContext context) {
  return CustomTextFormField(
    controller: TextEditingController(),
    title: 'Username',
    hintText: 'username',
    errorText: 'InvalidError',
  );
}

@WidgetbookUseCase(name: 'Obscure', type: CustomTextFormField)
Widget obscureCustomTextFormField(BuildContext context) {
  return CustomTextFormField(
    controller: TextEditingController(),
    title: 'Username',
    hintText: 'username',
    isObscure: true,
  );
}

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.title,
    required this.hintText,
    this.enabled = true,
    this.validator,
    this.textInputAction = TextInputAction.next,
    this.keyboardType,
    this.onChanged,
    this.inputFormatters,
    this.onObscureTap,
    this.isObscure,
    this.errorText,
  }) : super(key: key);
  final TextEditingController controller;
  final String title;
  final String hintText;
  final bool enabled;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final Function()? onObscureTap;
  final bool? isObscure;
  final String? errorText;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(widget.title, style: AppThemes.text1.bold),
        gapH8,
        TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Sizes.p12),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Sizes.p12),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Sizes.p12),
              borderSide: BorderSide(
                color: AppThemes.grey800,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Sizes.p12),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            isDense: true,
            hintText: widget.hintText,
            hintStyle: AppThemes.text2,
            enabled: widget.enabled,
            errorText: widget.errorText,
            errorStyle: AppThemes.subText1.red,
            errorMaxLines: 3,
            suffixIcon: widget.isObscure != null
                ? GestureDetector(
                    onTap: widget.onObscureTap,
                    child: Icon(
                      widget.isObscure! ? Icons.visibility_rounded : Icons.visibility_off_rounded,
                      color: AppThemes.grey800,
                    ),
                  )
                : null,
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: widget.validator,
          autocorrect: false,
          textInputAction: widget.textInputAction,
          keyboardType: widget.keyboardType,
          keyboardAppearance: Brightness.light,
          onChanged: widget.onChanged,
          inputFormatters: widget.inputFormatters,
          obscureText: widget.isObscure ?? false,
        ),
      ],
    );
  }
}
