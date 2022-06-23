import 'dart:convert';

import 'package:example_application/helper/url_helper.dart';
import 'package:example_application/model/item_result.dart';
import 'package:example_application/model/send_item_result.dart';
import 'package:http/http.dart' as http;

class APIService {
  Future<List<ItemResult>?> getListItemResult() async {
    try {
      final result = await http.get(Uri.parse(URLHelper.url + '/get_data/'));
      if (result.statusCode == 200) {
        return itemResultFromJson(result.body);
      } else {
        return [];
      }
    } catch (e) {
      return null;
    }
  }

  Future<SendItemResult> createItem(int id, String name) async {
    try {
      final result = await http.post(Uri.parse(URLHelper.url + '/send_data/'),
          body: jsonEncode({"id": id, "name": name}));
      if (result.statusCode == 200) {
        return SendItemResult.fromJson(jsonDecode(result.body));
      } else {
        SendItemResult badResponse =
            SendItemResult.fromJson(jsonDecode(result.body));
        return SendItemResult(message: badResponse.message);
      }
    } catch (e) {
      return SendItemResult(message: null);
    }
  }
}
