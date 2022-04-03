import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_payment/app/modules/home/controllers/request_a_pay_controller.dart';
import 'package:flutter_payment/app/utils/colors.dart';
import 'package:flutter_payment/app/utils/constants.dart';
import 'package:get/get.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class AddMoney extends GetView<RequestAPayController> {
  const AddMoney({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final TextTheme textTheme = Theme.of(context).textTheme;

    final ProgressDialog pd = ProgressDialog(
      context: context,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Money"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.color4, AppColors.color6],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Payment Method',
              style: textTheme.bodyText1?.copyWith(
                fontSize: 20,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    AppImages.payment.length,
                    (index) => Expanded(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () => controller.paymentMethod.value = index,
                        child: Obx(() => SizedBox(
                              width: width * .3,
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: controller.paymentMethod.value ==
                                              index
                                          ? AppColors.color5
                                          : Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.all(4.0),
                                  child: Image.asset(
                                    AppImages.payment[index],
                                  ),
                                ),
                              ),
                            )),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: width,
              child: ElevatedButton(
                onPressed: () async {
                  controller.isAddMoneyClick.toggle();
                  pd.show(
                    max: 100,
                    msgMaxLines: 3,
                    msg: 'SDK Loading. Payment will be processing',
                  );
                  Timer(const Duration(seconds: 3), () async {
                    pd.close();
                    ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                      const SnackBar(
                          content: Text(
                              'Successfully add amount to your account. Please check your email')),
                    );
                    await Future.delayed(const Duration(seconds: 2), () {
                      Get.back();
                    });
                  });
                },
                child: const Text('Proceed'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
