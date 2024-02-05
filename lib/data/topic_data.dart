import 'dart:convert';

import 'package:flutter/services.dart';

import 'model/topic.model.dart';

abstract class Topic_Data {
  Future<List<Topic>> loadDataTopic();
}

class AssestTopicData extends Topic_Data {
  @override
  Future<List<Topic>> loadDataTopic() async {
    await Future.delayed(Duration(seconds: 2));
    final jsonContent = await rootBundle.loadString("mock/topics/topics.json");
    final List<dynamic> jsonData =
        jsonDecode(jsonContent); //dinh dang ra json tu string
    return jsonData.map((e) => Topic.fromJson(e)).toList();
  }
}
