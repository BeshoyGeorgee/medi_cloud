import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/constant.dart';

class CustomLabeledTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final double? width;
  final double height;
  final bool isPassword;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;
  final bool readOnly;
  final Widget? suffixIcon;
  final Widget? prefixIcon; // الأيقونة اللي هتظهر على الشمال
  final Function(String)? onChanged; // أضفنا هذا السطر

  const CustomLabeledTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.width,
    this.height = 55,
    this.isPassword = false,
    this.controller,
    this.keyboardType,
    this.onTap,
    this.readOnly = false,
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged, // أضفنا هذا السطر
  });

  @override
  State<CustomLabeledTextField> createState() => _CustomLabeledTextFieldState();
}

class _CustomLabeledTextFieldState extends State<CustomLabeledTextField> {
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.label,
          style: Styles.textStyle18Bold.copyWith(
            color: const Color(0xff0D1B34),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: widget.width ?? double.infinity,
          height: widget.height,
          child: TextFormField(
            controller: widget.controller,
            onChanged: widget.onChanged, // ربط الـ onChanged بالـ TextFormField
            obscureText: obscureText,
            keyboardType: widget.keyboardType,
            onTap: widget.onTap,
            readOnly: widget.readOnly,
            textAlignVertical:
                TextAlignVertical.center, // لضبط النص في المنتصف رأسياً
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: Styles.textStyle16.copyWith(
                color: kPrimaryColor.withOpacity(0.6),
                fontWeight: FontWeight.w500,
              ),
              filled: true,
              fillColor: kTexrFieldFillColor,

              // الأيقونة اللي على الشمال (السهم في حالتنا)
              prefixIcon: widget.prefixIcon,

              // الأيقونة اللي على اليمين (العين في حالة الباسوورد)
              suffixIcon:
                  widget.isPassword
                      ? IconButton(
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        icon: Icon(
                          obscureText
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: kPrimaryColor,
                        ),
                      )
                      : widget.suffixIcon,

              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
