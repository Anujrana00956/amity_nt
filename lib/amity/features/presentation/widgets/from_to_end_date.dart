import 'package:amity_nt/amity/app/core/constant/app_image_constant.dart';
import 'package:flutter/material.dart';

class FromAndToDate extends StatelessWidget {
  const FromAndToDate({
    super.key,
    required this.textDate,
  });
  final String textDate;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 40,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFC7C7C8),
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            textDate,
            style: const TextStyle(
                color: Color(0xFF000000),
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          Image.asset(
            AppImageConstant.manageJobCalander,
            height: 20,
            width: 20,
          )
        ],
      ),
    );
  }
}
