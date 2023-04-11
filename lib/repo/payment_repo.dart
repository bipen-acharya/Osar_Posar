import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:osar_pasar/controller/service_provider_controller.dart';
import 'package:osar_pasar/utils/apis.dart';
import '../models/service_provider.dart';
import '../utils/storage_helper.dart';

class PaymentRepo {
  static Future<void> verifyKhaltiPayment({
    // required String service_provider_id,
    required String idx,
    required String amount,
    required String token,
    required Function(String message) onError,
  }) async {
    try {
      var accesstoken = StorageHelper.getToken();
      var headers = {
        "Accept": "application/json",
        "Authorization": accesstoken.toString(),
      };

      var body = {
        // "service_provider_id": service_provider_id,
        "idx": idx,
        "amount": "10",
        "token": token,
      };

      log(body.toString());

      http.Response response = await http.post(Uri.parse(Api.paymentCheckURL),
          headers: headers, body: body);

      log("${Api.paymentCheckURL} =========> ");
      log("res${response.body.toString()}");
      dynamic data = json.decode(response.body);

      if (data['status']) {
        log(data['data']);
        // onSuccess(booking);
      } else {
        onError(data['message']);
        log(data['data']);
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      onError("Sorry something went wrong");
    }
  }
}
