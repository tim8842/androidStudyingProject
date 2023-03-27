import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class AllHoroscope extends StatelessWidget {
  final Color colorText;
  final String title;
  final String iconPath;
  final String textDescription;

  const AllHoroscope(
      {super.key,
      required this.colorText,
      required this.title,
      required this.iconPath,
      required this.textDescription});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  iconPath,
                  height: 25,
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                      color: colorText,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ReadMoreText(
              textDescription,
              trimLines: 5,
              style: TextStyle(color: colorText),
              colorClickableText: Colors.pink,
              trimMode: TrimMode.Line,
              trimCollapsedText: '\n Читать ещё',
              trimExpandedText: '\n Свернуть',
              moreStyle: const TextStyle(
                fontSize: 13,
                height: 1.9,
                fontWeight: FontWeight.bold,
              ),
              lessStyle: const TextStyle(
                fontSize: 13,
                height: 1.9,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ));
  }
}
