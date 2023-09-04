import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:service_partner/domain/dtos/partner_dto.dart';
import 'package:service_partner/domain/dtos/token_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String baseUrl =
      'https://happyclean.azurewebsites.net/happyclean/api/v1/auth';

  static Future<TokenResponse?> googleAuthForPartner(
      PartnerDto partnerDto) async {
    final prefs = await SharedPreferences.getInstance();
    var url = Uri.parse('$baseUrl/partner/google-partner-info');
    var response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(partnerDto.toJson()));
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Add partner success');
      var tokenJson =
          TokenResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      prefs.setString("token", tokenJson.token);
      prefs.setString("refreshToken", tokenJson.refreshToken);
      return tokenJson;
    } else {
      return null;
    }
  }
}
