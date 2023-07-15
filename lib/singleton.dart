import 'package:flutter/material.dart';

class Singleton extends ChangeNotifier {
  static final Singleton _instance = Singleton._internal();

  // passes the instantiation to the _instance object
  factory Singleton() => _instance;

  // initialize our variables
  Singleton._internal();

  String name = '';
  String gender = '';
  String age = '';
  List<String> topics = [];

  void nameFunc(String text) {
    name = text;
    notifyListeners();
  }

  void genderFunc(String text) {
    gender = text;
    notifyListeners();
  }

  void ageFunc(String text) {
    age = text;
    notifyListeners();
  }

  void addTopic(String topic) {
    print("Add " + topic);
    topics.add(topic);
    notifyListeners();
  }

  void removeTopic(String topic) {
    print("Remove " + topic);
    topics.remove(topic);
    notifyListeners();
  }
}
