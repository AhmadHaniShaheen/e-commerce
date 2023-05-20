import 'package:e_commerce_app/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class BigTextWidget extends StatelessWidget {
  final Color color;
  final double size;
  final String text;
  final TextOverflow overflow;
  const BigTextWidget({
    super.key,
    this.color = AppColors.mainBlackColor,
    this.size = 20,
    required this.text,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: 1,
      style: GoogleFonts.roboto(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
