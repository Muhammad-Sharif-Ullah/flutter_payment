import 'package:flutter/material.dart';
import 'package:flutter_payment/app/modules/home/controllers/request_a_pay_controller.dart';
import 'package:flutter_payment/app/modules/home/views/actions_view/request_pyment/select_payer.dart';
import 'package:flutter_payment/app/utils/colors.dart';
import 'package:get/get.dart';

class RequestAPayment extends GetView<RequestAPayController> {
  const RequestAPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Request A Payment"),
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
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          width: width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: const [
                SizedBox(height: 20),
                SelectPayerWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
