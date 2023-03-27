import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:html/parser.dart' as html_parser;

class HoroscopeService {
  Future<void> getHoroscopeList() async {
    final response =
        await Dio().get('https://horo.mail.ru/prediction/taurus/tomorrow/');
    final document = html_parser.parse(response.data);
    final results = document.getElementsByClassName(
        'article__item article__item_alignment_left article__item_html');
    debugPrint(results[0].children[0].text);
    debugPrint(results[0].children[1].text);
  }
}
