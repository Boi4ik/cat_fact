import 'package:flutter_application_cat_fact/models/fact.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Boxes{
  static Box<Fact> getFacts() => Hive.box<Fact>('fact');
}