import 'package:flutter/material.dart';
import 'cat_app.dart';
import 'core/di/dependency_injection.dart';

void main() {
  setupDependencies();
  runApp(const CatApp());
}
