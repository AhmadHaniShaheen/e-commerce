import 'package:e_commerce_app/helpers/small_text_widget.dart';
import 'package:e_commerce_app/utilities/app_colors.dart';
import 'package:e_commerce_app/utilities/dimentions.dart';
import 'package:flutter/material.dart';

class TextDetails extends StatefulWidget {
  final String text;

  const TextDetails({super.key, required this.text});

  @override
  State<TextDetails> createState() => _TextDetailsState();
}

class _TextDetailsState extends State<TextDetails> {
  late String firstHalf;

  late String secandHalf;

  double textHeight = Dimentions.screenHeight / 3;

  bool hedinText = true;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secandHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secandHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secandHalf.isEmpty
          ? SmallTextWidget(
              text: firstHalf,
              size: 16,
              color: AppColors.pgrgColor,
            )
          : Column(
              children: [
                SmallTextWidget(
                    size: 16,
                    color: AppColors.pgrgColor,
                    text:
                        hedinText ? ("$firstHalf...") : firstHalf + secandHalf),
                SizedBox(
                  height: Dimentions.height16,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hedinText = !hedinText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallTextWidget(
                        text: 'show more',
                        size: Dimentions.height16,
                        color: AppColors.mainColor,
                      ),
                      Icon(
                        hedinText
                            ? Icons.arrow_drop_down_outlined
                            : Icons.arrow_drop_up_outlined,
                        color: AppColors.mainColor,
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
