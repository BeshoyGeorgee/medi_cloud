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
  final String? Function(String?)? validator;

  const CustomLabeledTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.width,
    this.height = 75,
    this.isPassword = false,
    this.controller,
    this.keyboardType,
    this.onTap,
    this.readOnly = false,
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged, // أضفنا هذا السطر
    this.validator,
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
          height: widget.height,
          child: TextFormField(
            validator: widget.validator,
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
          
              //error design handling
              errorStyle: const TextStyle(
                fontSize: 12, // تصغير الخط عشان يبان كله
                color: Colors.red,
                fontWeight: FontWeight.w400,
              ),
              errorMaxLines: 1,

              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
          
              //error border
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.red, width: 1.5),
              ),
          
              //when there is and error and the user want to skip
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.red, width: 2),
              ),
          
              //when there is no error and the user want to continue
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: kPrimaryColor, width: 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
