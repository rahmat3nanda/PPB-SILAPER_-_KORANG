import 'dart:developer';

import 'dart:io';

const kGAppName = "SILAPER KORANG";
String kGPackageName = Platform.isAndroid ? "id.nesd.silaper_korang": "id.nesd.silaperKorang";
const kGVersionName = "1.0.0";
const kGVersionCode = 1;

String kGLogTag = "[$kGAppName]";
const kGLogEnable = true;

void printLog(dynamic data) {
  if (kGLogEnable) {
    log("[${DateTime.now().toUtc()}]$kGLogTag$data");
  }
}
