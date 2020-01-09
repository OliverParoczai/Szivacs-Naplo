import 'dart:async';
import 'dart:convert' show json, utf8;
import 'dart:math';

import 'package:e_szivacs/Datas/Lesson.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../Datas/User.dart';
import '../Utils/Saver.dart';
import '../Utils/StringFormatter.dart';
import '../globals.dart' as globals;

class RequestHelper {

  static const String CLIENT_ID = "919e0c1c-76a2-4646-a2fb-7085bbbf3c56";
  static const String GRANT_TYPE = "password";
  static const String SETTINGS_API_URL = "https://www.e-szivacs.org/mirror/settings.json";
  static const String INSTITUTES_API_URL = "https://www.e-szivacs.org/mirror/school-list.json";
  static const String FAQ_API_URL = "https://raw.githubusercontent.com/boapps/e-Szivacs-2/master/gyik.md";
  static const String TOS_API_URL = "https://www.e-szivacs.org/adatkezeles_es_feltetelek.html";

  static const List<String> MODELS = [
    "SAMSUNG-SM-G930A",
    "MSD6A648",
    "SM-G935FD",
    "SM-G935A",
    "sdk_phone_armv7",
    "Nexus 6",
    "SM-G965F",
    "G8341",
    "Pixel",
    "Pixel 2",
    "Pixel 3",
    "Pixel 3a",
    "Pixel 3 XL",
    "Pixel 3a XL",
    "Pixel 4",
    "Nexus S",
    "S51SE",
    "HTCEVOV4G",
    "PG86100",
    "Galaxy Nexus",
    "GTI9300",
    "VK510",
    "GT-N5100",
    "SHIELD Tablet",
    "SAMSUNG-SM-G900A",
    "Nexus 7",
    "GT-S5830i",
    "hi6250",
    "MIBOX3",
    "GT-N7100",
    "Pixel 2 XL",
    "GT-I9505",
    "SAMSUNG-SM-G920A",
    "GT-N7100",
    "GT-N8010",
    "SM-G950F",
    "SM-G950U",
    "SAMSUNG-SGH-I337",
    "SM-J500M",
    "MXQ-4K",
    "Moto G (5)",
    "Samsung Chromebook Plus",
    "SM-G386F",
    "SM-T113",
    "Nexus 6",
    "GT-I9152",
    "XT1056",
    "HTC One_M8",
    "A37f",
    "MF353ZP/A",
    "SM-G610F",
    "PRO 5",
    "Nexus 6P",
    "SM-J120H",
    "HTCONE",
    "Lenovo X2-TO",
    "LG-K420",
    "SM-G960F",
    "SM-G960N",
    "SM-G9600",
    "SM-G9608",
    "SM-G960W",
    "SM-G960U",
    "SM-G960U1",
    "MI 9",
    "MI 8",
    "MI 9 SE",
    "MI 8 SE",
    "MI MIX 2S",
    "MIX 2",
    "MI A1",
    "MI A2",
    "Redmi Note 7",
    "Redmi Note 8",
    "Redmi Note 5",
    "Redmi Note 5A",
    "Redmi Note 6 Pro",
    "Redmi Note 7 Pro",
  ];
  
  void showError(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  void showSuccess(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  Future<String> getInstitutes() async {
    String institutesBody = utf8.decode((await http.get(INSTITUTES_API_URL)).bodyBytes);
    return institutesBody;
  }

  void refreshSzivacsSettigns() async {
    try {
      String settings = utf8.decode((await http.get(SETTINGS_API_URL)).bodyBytes);
      Map settingsJson = json.decode(settings);
      globals.userAgent = (settingsJson["FillableUserAgent"] as String).replaceFirst("<codename>", MODELS[Random(DateTime.now().millisecond).nextInt(MODELS.length-1)]);
      print("Using UserAgent: " + globals.userAgent);
      globals.latestVersion = globals.isBeta ? settingsJson["BetaVersion"] : settingsJson["CurrentAppVersion"];
    } catch (e) {
      print(e);
    }
  }

  Future<String> getFAQ() async {
    String faq = (await http.get(FAQ_API_URL)).body;
    return faq;
  }

  Future<String> getTOS() async {
    String tos = utf8.decode((await http.get(TOS_API_URL)).bodyBytes);
    return tos;
  }

  Future<String> getStuffFromUrl(String url, String accessToken, String schoolCode) async {
    if (accessToken != null) {
      http.Response response = await http.get(
          url,
          headers: {
            "HOST": schoolCode + ".e-kreta.hu",
            "User-Agent": globals.userAgent,
            "Authorization": "Bearer " + accessToken
          });

      return response.body;
    }
  }

  Future<String> getTests(String accessToken, String schoolCode) =>
      getStuffFromUrl("https://" + schoolCode + ".e-kreta.hu/mapi/api/v1/BejelentettSzamonkeres?DatumTol=null&DatumIg=null", accessToken, schoolCode);

  Future<String> getMessages(String accessToken, String schoolCode) =>
      getStuffFromUrl("https://eugyintezes.e-kreta.hu/integration-kretamobile-api/v1/kommunikacio/postaladaelemek/sajat", accessToken, schoolCode);

  Future<String> getMessageById(int id, String accessToken, String schoolCode) =>
      getStuffFromUrl("https://eugyintezes.e-kreta.hu/integration-kretamobile-api/v1/kommunikacio/postaladaelemek/$id", accessToken, schoolCode);

  Future<String> getEvaluations(String accessToken, String schoolCode) =>
      getStuffFromUrl("https://" + schoolCode + ".e-kreta.hu"
          + "/mapi/api/v1/Student", accessToken, schoolCode);

  Future<String> getHomework(String accessToken, String schoolCode,
      int id) => getStuffFromUrl("https://" + schoolCode +
      ".e-kreta.hu/mapi/api/v1/HaziFeladat/TanuloHaziFeladatLista/" +
      id.toString(), accessToken, schoolCode);

  Future<String> getHomeworkByTeacher(String accessToken,
      String schoolCode, int id) => getStuffFromUrl("https://" + schoolCode +
      ".e-kreta.hu/mapi/api/v1/HaziFeladat/TanarHaziFeladat/" + id.toString(),
      accessToken, schoolCode);

  Future<String> getEvents(String accessToken, String schoolCode) =>
      getStuffFromUrl("https://" + schoolCode + ".e-kreta.hu/mapi/api/v1/Event",
          accessToken, schoolCode);

  Future<String> getTimeTable(
      String from, String to, String accessToken, String schoolCode) =>
      getStuffFromUrl("https://" +
          schoolCode +
          ".e-kreta.hu/mapi/api/v1/Lesson?fromDate=" +
          from +
          "&toDate=" +
          to, accessToken, schoolCode);

  Future<String> getBearer(String jsonBody, String schoolCode, bool showErrors) async {
    http.Response response;
    try {
      response = await http.post("https://" + schoolCode + ".e-kreta.hu/idp/api/v1/Token",
          headers: {
            "HOST": schoolCode + ".e-kreta.hu",
            "Content-Type": "application/x-www-form-urlencoded; charset=utf-8",
            "User-Agent": globals.userAgent
          },
          body: jsonBody);

      return response.body;
    } catch (e) {
      if (showErrors)
        showError("Hálózati hiba");
      return null;
    }
  }

  void uploadHomework(String homework, Lesson lesson, User user) async {
    Map body = {
      "OraId": lesson.id.toString(),
      "OraDate": dateToHuman(lesson.date) + "00:00:00",
      "OraType": lesson.calendarOraType,
      "HataridoUtc": dateToHuman(lesson.date.add(Duration(days: 2))) + "23:00:00",
      "FeladatSzovege": homework
    };

    String token = await getBearerToken(user, true);
    String jsonBody = json.encode(body);

    try {
      http.Response response = await http.post("https://" + user.schoolCode + ".e-kreta.hu/mapi/api/v1/HaziFeladat/CreateTanuloHaziFeladat",
          headers: {
            "HOST": user.schoolCode + ".e-kreta.hu",
            "Authorization": "Bearer " + token,
            "Content-Type": "application/json; charset=utf-8",
            "User-Agent": globals.userAgent
          },
          body: jsonBody);
      if (response.statusCode == 200)
        showSuccess("Házi sikeresen feltöltve");
      else
        showError("Hiba történt");
    } catch (e) {
      print(e);
      showError("Hálózati hiba");
      return null;
    }

  }

  Future<String> getBearerToken(User user, bool showErrors) async {
    String body =
        "institute_code=${user.schoolCode}&"
        "userName=${user.username}&"
        "password=${user.password}&"
        "grant_type=$GRANT_TYPE&"
        "client_id=$CLIENT_ID";

    try {
      String bearerResponse = await RequestHelper().getBearer(
          body, user.schoolCode, showErrors);

      if (bearerResponse != null) {
        Map<String, dynamic> bearerMap = json.decode(bearerResponse);
        if (bearerMap["error"] == "invalid_grant" && showErrors)
          showError("Hibás jelszó vagy felhasználónév");

        String code = bearerMap["access_token"];

        return code;
      }
    } catch (e) {
      if (showErrors)
        showError("hiba");
      print(e);
    }

    return null;
  }

  void seeMessage(int id, User user) async {
    try {
      String code = await getBearerToken(user, true);

      await http.post("https://eugyintezes.e-kreta.hu//integration-kretamobile-api/v1/kommunikacio/uzenetek/olvasott",
          headers: {
            "Authorization": ("Bearer " + code),
          },
          body: "{\"isOlvasott\":true,\"uzenetAzonositoLista\":[$id]}");
    } catch (e) {
      print(e);
      showError("Hálózati hiba");
      return null;
    }
  }

  Future<String> getStudentString(User user, bool showErrors) async {
    String code = await getBearerToken(user, showErrors);

    String evaluationsString = await getEvaluations(code, user.schoolCode);

    return evaluationsString;
  }

  Future<String> getEventsString(User user, bool showErrors) async {
    String code = await getBearerToken(user, showErrors);

    String eventsString = await getEvents(code, user.schoolCode);

    saveEvents(eventsString, user);

    return eventsString;
  }

}
