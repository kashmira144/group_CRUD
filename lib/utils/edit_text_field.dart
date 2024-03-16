import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:group_crud/utils/number_constants.dart';
import 'package:group_crud/utils/string_constants.dart';
import 'package:group_crud/utils/utils.dart';

class WidgetEditTextField extends StatefulWidget {
  //String
  final String textFieldHint;
  final String? helperText;
  final String? counterText;

  //Boolean
  final bool obscureText;
  final bool? isFilled;
  final bool? isEnabled;
  final bool? isReadOnly;

  //Integers
  final int? maxLength;

  //Objects
  final TextInputAction? textInputAction;
  final TextInputType textInputType;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function onSubmitField;
  final Function? onChanged;
  final Function? onEditingComplete;
  final Function? onTap;
  final TextCapitalization textCapitalization;

  final List<TextInputFormatter>? inputFormatter;

  final FocusNode? focusNode;
  final List<String>? autofillHints;
  final bool? enableSuggestions;
  final bool? autoCorrect;

  const WidgetEditTextField(
      {Key? key,
        required this.textFieldHint,
        required this.textInputType,
        this.textInputAction = TextInputAction.next,
        this.obscureText = StringConstants.IS_SELECTED_FALSE,
        required this.controller,
        this.suffixIcon,
        this.prefixIcon,
        this.maxLength,
        required this.onSubmitField,
        this.onChanged,
        this.onEditingComplete,
        this.helperText,
        this.isFilled = StringConstants.IS_SELECTED_TRUE,
        this.isEnabled,
        this.counterText,
        this.isReadOnly,
        this.inputFormatter,
        this.focusNode,
        this.onTap,
        this.autofillHints,
        this.enableSuggestions,
        this.autoCorrect,
        this.textCapitalization = TextCapitalization.none})
      : super(key: key);

  @override
  State<WidgetEditTextField> createState() => _WidgetEditTextFieldState();
}

class _WidgetEditTextFieldState extends State<WidgetEditTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          top: NumberConstant.DOUBLE_TEN,
          bottom: NumberConstant.DOUBLE_TEN,
        ),
        child: TextField(
          onTapOutside: (value) => hideKeyboard(),
          focusNode: widget.focusNode,
          inputFormatters: widget.inputFormatter,
          readOnly: widget.isReadOnly ?? StringConstants.IS_SELECTED_FALSE,
          enabled: widget.isEnabled,
          controller: widget.controller,
          autofillHints: widget.autofillHints,
          enableSuggestions:
          widget.enableSuggestions ?? StringConstants.IS_SELECTED_FALSE,
          autocorrect: widget.autoCorrect ?? StringConstants.IS_SELECTED_FALSE,
          smartDashesType: SmartDashesType.enabled,
          style: const TextStyle(
              color: Colors.black,
              fontSize: NumberConstant.DOUBLE_FOURTEEN,
              fontWeight: FontWeight.w400),
          textCapitalization:
          widget.textCapitalization ?? TextCapitalization.none,
          decoration: InputDecoration(
              labelText: widget.textFieldHint,
              labelStyle: const TextStyle(color: Colors.grey),
              counterText: StringConstants.TEXT_EMPTY,
              contentPadding: const EdgeInsets.only(
                top: NumberConstant.DOUBLE_FOURTEEN,
                bottom: NumberConstant.DOUBLE_THIRTEEN,
                left: NumberConstant.DOUBLE_TWENTY_FOUR,
                right: NumberConstant.DOUBLE_TWENTY_FOUR,
              ),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black45),
                  borderRadius: BorderRadius.all(
                      Radius.circular(NumberConstant.DOUBLE_THIRTY_EIGHT))),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black45),
                  borderRadius: BorderRadius.all(
                      Radius.circular(NumberConstant.DOUBLE_THIRTY_EIGHT))),
              filled: widget.isFilled,
              hintStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: NumberConstant.DOUBLE_FOURTEEN,
                  fontWeight: FontWeight.w400),
              hintText: widget.textFieldHint,
              fillColor: Colors.white,
              suffixIcon: widget.suffixIcon,
              helperText: widget.helperText,
              prefixIcon: widget.prefixIcon),
          keyboardType: widget.textInputType,
          onSubmitted: (value) {
            widget.onSubmitField();
          },
          obscureText: widget.obscureText,
          maxLength: widget.maxLength,
          onChanged: (value) {
            if (widget.onChanged != null) {
              widget.onChanged!();
            }
          },
          onEditingComplete: () {
            if (widget.onEditingComplete != null) {
              widget.onEditingComplete!();
            }
          },
          onTap: () {
            if (widget.onTap != null) {
              widget.onTap!();
            }
          },
        ));
  }
}
