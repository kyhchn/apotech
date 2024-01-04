import 'package:apotech/app/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class ApotechTextField extends StatefulWidget {
  const ApotechTextField(
      {super.key,
      required this.controller,
      this.validator,
      this.onTap,
      this.inputFormatters,
      this.leadingAsset,
      this.keyboardType = TextInputType.text,
      this.suffix,
      this.isPasswordType = false,
      this.useLabel = false,
      required this.hintText});

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? leadingAsset;
  final String hintText;
  final Widget? suffix;
  final bool useLabel;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onTap;
  final bool isPasswordType;

  @override
  State<ApotechTextField> createState() => _ApotechTextFieldState();
}

class _ApotechTextFieldState extends State<ApotechTextField> {
  var isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onTap: widget.onTap,
        keyboardType: widget.isPasswordType
            ? TextInputType.visiblePassword
            : widget.keyboardType,
        style: const TextStyle(
            color: purpleText, fontSize: 15, fontWeight: FontWeight.w400),
        validator: widget.validator,
        obscureText: widget.isPasswordType ? isObscure : false,
        inputFormatters: widget.inputFormatters,
        textAlignVertical: TextAlignVertical.center,
        controller: widget.controller,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          label: widget.useLabel
              ? Text(
                  widget.hintText,
                )
              : null,
          hintStyle: TextStyle(
              color: purpleText.withOpacity(0.45),
              fontSize: 15,
              fontWeight: FontWeight.w400),
          suffixIcon: widget.isPasswordType
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon: Icon(
                    isObscure
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: purpleText.withOpacity(0.45),
                  ),
                )
              : widget.suffix,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 11,
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),
          prefixIcon: widget.leadingAsset != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: SvgPicture.asset(
                    widget.leadingAsset!,
                    width: 25,
                    height: 25,
                  ),
                )
              : null,
          hintText: widget.hintText,
        ));
  }
}
