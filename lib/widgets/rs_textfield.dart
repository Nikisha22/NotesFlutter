import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';

class RSTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool obscureText;
  final Widget? prefixIcon;
  final bool autofocus;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;

  const RSTextField({
    super.key,
    this.controller,
    required this.hintText,
    this.obscureText = false,
    this.prefixIcon,
    this.autofocus = false,
    this.focusNode,
    this.validator,
    this.onChanged,
    this.onEditingComplete
  });

  // String? _validate(String? value) {
  //   if (notEmpty && (value == null || value.isEmpty)) {
  //     return 'mandatory_text';
  //   }
  //   if (isNumber && !Utility.isNumber(value)) {
  //     return 'invalid_input';
  //   }
  //   if (isAlphaNum && !kAplhaNumRegEx.hasMatch(value ?? '')) {
  //     return 'invalid_input';
  //   }
  //   if (isEmail && !Utility.isEmail(value)) {
  //     return 'invalid_email';
  //   }
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    return UniversalPlatform.isIOS
        ? Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: CupertinoTextFormFieldRow(
              controller: controller,
              autofocus: autofocus,
              focusNode: focusNode,
              placeholder: hintText,
              obscureText: obscureText,
              prefix: prefixIcon,
              validator: validator,
              onChanged: onChanged,
              onEditingComplete: onEditingComplete,
            ),
          )
        : TextFormField(
            controller: controller,
            autofocus: autofocus,
            focusNode: focusNode,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: prefixIcon,
            ),
            validator: validator,
            onChanged: onChanged,
            onEditingComplete: onEditingComplete,
          );
  }
}
