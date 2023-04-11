import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:osar_pasar/repo/payment_repo.dart';
import 'package:osar_pasar/utils/colors.dart';
import 'package:osar_pasar/utils/storage_helper.dart';

import '../models/access_token.dart';
import '../utils/image_path.dart';
import '../utils/snackbar.dart';

class ActiveBooking extends StatelessWidget {
  const ActiveBooking({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(Get.context!).textTheme;
    var theme = Theme.of(Get.context!);
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        shadowColor: const Color(0xFF494949).withOpacity(0.06),
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        title: Text(
          "Active Booking",
          style: textTheme.titleLarge!
              .copyWith(fontSize: 16, color: AppColors.textColor),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 150,
            margin: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 26),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage(
                  ImagePath.backgroung,
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 13, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Service Provider’s Name",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "12th Jan 2023, 01:00 PM",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      paywithKhaltiInApp();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 76, 21, 184)),
                    child: const Text(
                      "Pay with Khalti",
                    ),
                  ),
                  // Text(referenceId),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

paywithKhaltiInApp() {
  KhaltiScope.of(Get.context!).pay(
    config: PaymentConfig(
        amount: 1000,
        productIdentity: "Product ID",
        productName: "Product Name"),
    preferences: [PaymentPreference.khalti],
    onSuccess: onSuccess,
    onFailure: onFailure,
    onCancel: onCancel,
  );
}

void onSuccess(PaymentSuccessModel result) {
  PaymentRepo.verifyKhaltiPayment(
    // service_provider_id: ,
    idx: result.idx,
    amount: "10",
    token: result.token,
    onError: (message) {
      log("Error Message");
    },
  );
}

void onFailure(PaymentFailureModel failure) {
  debugPrint(failure.toString());
}

void onCancel() {
  debugPrint("Cancelled");
}
