import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class HeaderHoroscope extends StatelessWidget {
  HeaderHoroscope({super.key, this.text});
  String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: ReadMoreText(
          text!,
          trimLines: 4,
          colorClickableText: Colors.pink,
          trimMode: TrimMode.Line,
          trimCollapsedText: '\n Читать ещё',
          trimExpandedText: '\n Свернуть',
          moreStyle: TextStyle(
            fontSize: 13,
            height: 1.9,
            fontWeight: FontWeight.bold,
          ),
          lessStyle: TextStyle(
            fontSize: 13,
            height: 1.9,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}
