import 'package:base_structure/ui/utils/app_constants.dart';
import 'package:base_structure/ui/utils/themes/app_colors.dart';
import 'package:base_structure/ui/utils/widgets/common_ink_well.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonFormField extends StatefulWidget {
  final String hintText; // Hint Text
  final TextEditingController?
  controller; // Text editing controller to use content of the text field
  final bool? obscureText; // Decide whether to show contents of text field
  final TextInputType? inputType; // Keyboard Type
  final ValueChanged<String>?
  onChangedFunction; // Function executed when the content of text field is changed
  final FormFieldValidator<String>? validatorFunction; // Validation function
  final FormFieldSetter<String>?
  onSavedFunction; // Function to save contents of the text field
  final List<TextInputFormatter>?
  textInputFormatter; // Extra restrictions on text field
  final TextInputAction? textInputAction; // decides which button to show at bottom end of keyboard
  final void Function(String)? onFieldSubmitted; // decides which action to perform on submitting
  final List<String> ?autofillHints; // Keyboards suggest autofill according to the type
  final AutovalidateMode? autovalidate; // decides which type of auto validation to perform
  final InputBorder? border;
  final InputBorder? focusedBorder;

  const CommonFormField({
    super.key,
    this.controller,
    this.hintText = AppConstants.strEmpty,
    this.obscureText,
    this.inputType,
    this.onChangedFunction,
    this.validatorFunction,
    this.onSavedFunction,
    this.textInputFormatter,
    this.textInputAction,
    this.onFieldSubmitted, 
    this.autofillHints, 
    this.autovalidate, 
    this.border, 
    this.focusedBorder,
  });

  @override
  State<CommonFormField> createState() => _CommonFormFieldState();
}

class _CommonFormFieldState extends State<CommonFormField> {
  late bool? obscure; // local variable for toggling obscure text

  @override
  void initState() {
    // initializes the late variables
    obscure = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onTapOutside: (_) {
        FocusManager.instance.primaryFocus!
            .unfocus(); // On tapping outside, unfocus
      },
      autovalidateMode: widget.autovalidate ?? AutovalidateMode.onUserInteraction,
      autofillHints: widget.autofillHints,
      onChanged: widget.onChangedFunction,
      onSaved: widget.onSavedFunction,
      validator: widget.validatorFunction,
      obscureText: obscure ?? false,
      keyboardType: widget.inputType,
      inputFormatters: widget.textInputFormatter,
      textInputAction: widget.textInputAction ?? TextInputAction.next,
      onFieldSubmitted: widget.onFieldSubmitted ?? (value) => {},
      decoration: InputDecoration(
        border: widget.border ?? OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.clrGreyB5B5B5),
        ),
        focusedBorder: widget.focusedBorder ?? OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.clrBlack000000),
        ),
        hintStyle: TextStyle(fontSize: 14),
        hintText: widget.hintText,
        suffixIcon:
            obscure !=
                null // only shows the icon when obscureText is provided
            ? CommonInkWell(
                // changes the obscure text and also the icon
                onTap: () {
                  setState(() {
                    obscure = !obscure!;
                  });
                },
                child: obscure!
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
              )
            : null,
        suffixIconConstraints: BoxConstraints(minHeight: 35),
      ),
    );
  }
}