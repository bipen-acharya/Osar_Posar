import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:osar_pasar/models/order_request.dart';
import 'package:osar_pasar/utils/apis.dart';

import '../utils/storage_helper.dart';

class OrderRequestrepo {
  static Future<void> getAllOrderRequest(
      {required Function(List<OrderRequest>) onSuccess,
      required Function(String message) onError}) async {
    try {
      var url = Uri.parse(OsarPasarAPI.orderRequest);
      http.Response response = await http.get(
        url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": StorageHelper.getToken()!.toString()
        },
      );
      var data = json.decode(response.body);
      print(data);
      if (data['success']) {
        log("on sucess ma aayo");
        print(orderRequestListFromJson(data['data']));
        log("on sucess ma aayo123");
        onSuccess(orderRequestListFromJson(data['data']));
        // print(data.toString());
      } else {
        onError(data['message']);
      }
    } catch (e) {
      log("-->>>>$e");
      onError("Sorry something went wrong. Please try again");
    }
  }
}
