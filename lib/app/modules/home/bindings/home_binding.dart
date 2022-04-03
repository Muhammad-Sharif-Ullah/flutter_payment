import 'package:get/get.dart';

import 'package:flutter_payment/app/modules/home/controllers/invoce_controller.dart';
import 'package:flutter_payment/app/modules/home/controllers/request_a_pay_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InvoiceController>(
      () => InvoiceController(),
    );
    Get.lazyPut<RequestAPayController>(
      () => RequestAPayController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
