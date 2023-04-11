import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:osar_pasar/screens/home.dart';
import 'package:osar_pasar/utils/colors.dart';
import 'package:osar_pasar/utils/image_path.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

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
            Get.offAll(() => HomePage());
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
          "Requests",
          style: textTheme.titleLarge!
              .copyWith(fontSize: 16, color: AppColors.textColor),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: ListView.builder(
            itemCount: 1,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        width: 0.5, color: Color.fromARGB(255, 222, 222, 222)),
                  ),
                ),
                // padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Today",
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Service Provider’s Name",
                              style: TextStyle(
                                  color: Colors.black45, fontSize: 14),
                            ),
                            Text(
                              "PENDING",
                              style: TextStyle(
                                  color: Color.fromARGB(204, 255, 128, 0),
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SvgPicture.asset(AllImages.waiting),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
