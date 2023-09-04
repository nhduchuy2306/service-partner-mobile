import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:service_partner/domain/models/partner.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PartnerService {
  static const String baseUrl =
      'https://happyclean.azurewebsites.net/happyclean/api/v1';

  static Future<Partner?> updatePartner(
      String partnerId, Partner partner) async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token") ?? "";
    var url = Uri.parse('$baseUrl/partners/$partnerId');
    var response = await http.put(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(partner.toJson()));
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Update partner success');
      print(response.body);
      var partnerJson = jsonDecode(utf8.decode(response.bodyBytes));
      return Partner.fromJson(partnerJson);
    } else {
      return null;
    }
  }

  static Future<Partner?> getPartnerById(String partnerId) async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token") ?? "";
    var url = Uri.parse('$baseUrl/partners/$partnerId');

    var response = await http.get(url, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    });
    if (response.statusCode == 200) {
      print('Get partner success');
      var partnerJson = jsonDecode(utf8.decode(response.bodyBytes));
      return Partner.fromJson(partnerJson);
    } else {
      return null;
    }
  }
}