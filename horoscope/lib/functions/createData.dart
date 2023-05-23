// ignore_for_file: file_names, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

void createData(String email) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? name = ((prefs.getString("name")) ?? 0) as String?;
  String? birthday = ((prefs.getString("birthday")) ?? 0) as String?;
  String? gender = ((prefs.getString("gender")) ?? 0) as String?;

  await prefs.setInt("initScreen", 0);
  CollectionReference db = FirebaseFirestore.instance.collection('users');
  final docSnap = db.doc(email);
  docSnap
      .set({
        'name': name,
        'surname': '',
        'gender': gender,
        'birthday': birthday,
        'country': 'Choose Country',
        'state': 'Choose State',
        'city': 'Choose City',
        'information': ''
      })
      .then((value) => print('added'))
      .catchError((error) => print('Add failed: $error'));
}
