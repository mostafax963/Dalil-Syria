import 'package:dalil_syria/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  final String label;
  final String hintText;
  final IconData leadingIcon;
  final bool isPassword;
  final IconData? trailingIcon;
  final TextEditingController controller;
  final String? errorText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const CustomInputField({
    super.key,
    required this.label,
    required this.hintText,
    required this.leadingIcon,
    required this.controller,
    this.isPassword = false,
    this.trailingIcon,
    this.errorText,
    this.keyboardType,
    this.validator,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  late bool obscure;

  @override
  void initState() {
    super.initState();
    obscure = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),

        TextFormField(
          validator: widget.validator,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: obscure,
          decoration: InputDecoration(
            fillColor: AppColors.divider(context),
            hintText: widget.hintText,
            errorText: widget.errorText,
            filled: true,

            prefixIcon: Icon(
              widget.leadingIcon,
              color: const Color(0xFF7D848D),
            ),

            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                    icon: Icon(
                      obscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                  )
                : (widget.trailingIcon != null
                      ? Icon(widget.trailingIcon)
                      : null),

            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: Color(0xFF0D6EFD)),
            ),

            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}
