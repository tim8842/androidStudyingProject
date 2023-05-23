import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:shared_preferences/shared_preferences.dart';

class HoroscopeService {
  Future<Map> getHoroscopeData(int periodIndex, String horoscopeName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final day = DateTime.now().day;
    final dayOfCall = (prefs.getInt("dateOfCall")) ?? 0;
    final prevHoroscope = (prefs.getString("prevHoroscope")) ?? 0;
    Map data = {};
    if (day == dayOfCall && prevHoroscope == horoscopeName) {
      String? dataString = (prefs.getString("dataOfHoroscope"));
      data = json.decode(dataString!);
      return data;
    } else
      await prefs.setInt("dateOfCall", day);
    final res = await Future.wait([
      getDataFromMail(horoscopeName),
      getDataManWomanRambler(horoscopeName),
      getDataFromRambler(horoscopeName)
    ]);
    data['headerInfo'] = res[0];
    data['manAndWoman'] = res[1];
    data['ramblerTypes'] = res[2];
    await prefs.setString("dataOfHoroscope", json.encode(data));
    await prefs.setString("prevHoroscope", horoscopeName);
    return data;
  }

  Future<String> parseHoroscopePage(
      String url, String html_name_element) async {
    String finalStr = "";
    final response = await Dio().get(url);
    final document = html_parser.parse(response.data);
    final results = document.getElementsByClassName(html_name_element);
    results[0].children.forEach((element) {
      finalStr = finalStr + element.text;
    });
    return finalStr;
  }

  Future<String> parseRamblerPage(String url, int countOfTags) async {
    final response = await Dio().get(url);
    final document = html_parser.parse(response.data);
    final result = document.getElementsByTagName('p');
    String finalString = "";
    for (int i = 0; i < countOfTags; i++) {
      if (result.length != 0) {
        finalString = finalString + result[i].text;
      } else
        finalString = "Эксперты не заполнили данные, мы сожалеем";
    }
    ;
    return finalString;
  }

  Future<List> getDataManWomanRambler(String horoscopeName) async {
    List name = ['man', 'woman'];
    List<Future> data = []; // man - 0, woman - 1
    List normalData = [];
    for (int i = 0; i < 2; i++) {
      data.add(parseRamblerPage(
          'https://horoscopes.rambler.ru/${horoscopeName}/${name[i]}/today/',
          2));
    }
    normalData = await Future.wait(data);
    return normalData;
  }

  Future<List> getDataFromRambler(String horoscopeName) async {
    List<String> nameTypes = ['erotic', 'career', 'sex-horoscope'];
    List types = [];
    List normalData = [];
    List<Future> data = [];
    List<String> periods = ['', 'tomorrow/', 'weekly/'];
    for (int i = 0; i < nameTypes.length; i++) {
      if (i == 2) periods[0] = 'today/';
      for (int l = 0; l < periods.length; l++) {
        data.add(parseRamblerPage(
            'https://horoscopes.rambler.ru/${horoscopeName}/${nameTypes[i]}/${periods[l]}',
            1));
      }
    }
    normalData = await Future.wait(data);
    for (int i = 0; i < normalData.length; i += 3) {
      types.add(normalData.sublist(i, i + 3));
    }
    return types;
  }

  Future<List> getDataFromMail(String horoscopeName) async {
    List<String> periods = ['today', 'tomorrow', 'week'];
    List<Future> data = [];
    List normalData = [];
    for (int i = 0; i < periods.length; i++) {
      data.add(parseHoroscopePage(
          'https://horo.mail.ru/prediction/${horoscopeName}/${periods[i]}/',
          'article__item article__item_alignment_left article__item_html'));
    }
    normalData = await Future.wait(data);
    return normalData;
  }
}
