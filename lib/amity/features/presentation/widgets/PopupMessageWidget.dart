import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopupMessageWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String okText;
  final Function onTap;

  const PopupMessageWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.okText,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      child: Container(
        
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: const Color(0xFFC7C7C8),
            width: 1.5,
          ),
        ),
        height: 220,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                title,
                style: const TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap: () {
                      onTap();
                    },
                    child: const ButtonsOfLogOut(
                        color: Color(0xFFA3CA3E), text: "Logout")),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const ButtonsOfLogOut(
                    color: Color(0xFFC24F45),
                    text: 'Cancel',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonsOfLogOut extends StatelessWidget {
  const ButtonsOfLogOut({
    super.key,
    required this.color,
    required this.text,
  });
  final Color color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 38),
      height: 42,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 13,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
