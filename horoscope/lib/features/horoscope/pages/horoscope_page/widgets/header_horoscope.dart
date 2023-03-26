import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class HeaderHoroscope extends StatelessWidget {
  const HeaderHoroscope({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: const ReadMoreText(
          'Начало дня будет благоприятным с точки зрения личных отношений, подойдет для встречи с человеком, которому вы хотели бы понравиться. Не исключены романтические сюрпризы, некоторые Водолеи услышат слова, которых давно ждали. А еще в это время хорошо строить планы и обсуждать их с самыми близкими.',
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
