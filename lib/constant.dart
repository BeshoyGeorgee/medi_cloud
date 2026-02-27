import 'package:flutter/material.dart';

//Constants for the app:

//Primary Color:
const Color kPrimaryColor = Color(0xFF2A988F);
// SHAD of Primary Color
const Color kShadePrimaryColor = Color(0xFF16504B);
//Secondary Color:
const Color kSecondaryColor = Color(0xFF425C9E);
//Background Color:
const Color kBackgroundColor = Color(0xFFF4F7F9);
// Text or Icon Grey Color:
const Color kGreyColor = Color(0xFF6C7072);
// White color with 20% opacity (Used for icon backgrounds on dark cards)
const Color kWhiteOpacity20 = Color(0x33FFFFFF);

// --- Decorations (Borders & Shadows) ---
abstract class AppDecorations {
  // Border Radius موحد للكروت الكبيرة
  static final borderRadius25 = BorderRadius.circular(25);
  
  // Shadow موحد للكروت عشان يدي عمق خفيف
// Shadow موحد للكروت عشان يدي عمق خفيف
  static const defaultShadow = BoxShadow(
    // 0x0D هو ما يعادل 5% شفافية، والـ 000000 هو اللون الأسود
    color: Color(0x0D000000), 
    blurRadius: 15,
    offset: Offset(0, 5),
  );
}