import 'package:e_commerce_app/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class SmallTextWidget extends StatelessWidget {
  final Color color;
  final double size;
  final String text;
  final double height;
  const SmallTextWidget({
    super.key,
    this.color = AppColors.textColor,
    this.size = 12,
    required this.text,
    this.height = 1.2,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        color: color,
        fontSize: size,
        height: height,
      ),
    );
  }
}
