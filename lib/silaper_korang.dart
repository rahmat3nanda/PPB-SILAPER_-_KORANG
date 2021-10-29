import 'package:flutter/material.dart';
import 'package:silaper_korang/common/configs.dart';
import 'package:silaper_korang/common/constans.dart';
import 'package:silaper_korang/common/styles.dart';
import 'package:silaper_korang/page/splash_page.dart';

class SilaperKorang extends StatelessWidget {
  const SilaperKorang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: kLDelegates,
      supportedLocales: kLSupports,
      debugShowCheckedModeBanner: false,
      title: kGAppName,
      theme: tdMain,
      home: const SplashPage(),
    );
  }
}