import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:silaper_korang/silaper_korang.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const SilaperKorang());
}
