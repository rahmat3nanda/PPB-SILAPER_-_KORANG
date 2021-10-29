import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:silaper_korang/common/constans.dart';
import 'package:silaper_korang/common/styles.dart';
import 'package:silaper_korang/data/sp_data.dart';
import 'package:silaper_korang/model/singleton_model.dart';
import 'package:silaper_korang/model/user_model.dart';
import 'package:silaper_korang/page/login_page.dart';
import 'package:silaper_korang/page/main_page.dart';
import 'package:silaper_korang/tool/fcm_service.dart';
import 'package:silaper_korang/tool/helper.dart';
import 'package:silaper_korang/tool/permissions_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late SingletonModel _model;
  late Helper _helper;

  @override
  void initState() {
    super.initState();
    _model = SingletonModel.withContext(context);
    _helper = Helper();
    _checkData();
  }

  void _checkData() async {
    String? user = await SPData().load(kDUser);
    _model.fcmToken = await FcmService().getToken();
    _model.isLoggedIn = user != null;
    if (_model.isLoggedIn) {
      _model.user = UserModel.fromJson(jsonDecode(user!));
    }

    await PermissionService.reqAllPermissions();
    _helper.moveToPage(context,
        page: _model.isLoggedIn ? const MainPage() : const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Text(
            kGAppName,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 32.0,
            ),
          ),
        ),
      ),
    );
  }
}
