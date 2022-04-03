import 'package:flutter/material.dart';
import 'package:flutter_payment/app/modules/home/bindings/home_binding.dart';
import 'package:flutter_payment/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_payment/app/modules/home/views/home_view.dart';
import 'package:flutter_payment/model/invoice_model.dart';
import 'package:get/get.dart';

class InvoiceController extends GetxController {
  var items = [
    ['', '']
  ].obs;
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  final HomeController homeCNT = Get.find<HomeController>();
  RxString name = "".obs;
  RxString email = "".obs;
  RxString phone = "".obs;
  RxString address = "".obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  createInvoice(BuildContext context) async {
    double total = 0.0;
    for (int i = 0; i < items.length; i++) {
      total += double.parse(items[i][1]);
    }
    final InvoiceModel invoice = InvoiceModel(
      creatorName: "Md. Sharif Ullah",
      creatorEmail: 'exmaple@gmail.com',
      items: items,
      recipientEmail: email.value.trim(),
      recipientName: name.value.trim(),
      recipientPhone: name.value.trim(),
      recipientAddress: address.value.trim(),
      createAt: DateTime.now(),
      status: 0,
      payment: total + 0.6,
      complete: DateTime.now(),
      description: '',
      fee: 0.6,
      paymentRequestDueDate: DateTime.now(),
      paymentRequestId: 43434343443,
      processing: DateTime.now(),
      receivedByRecipient: DateTime.now(),
      recipientGets: total,
      transactionId: 323232424,
    );
    homeCNT.invoices.add(invoice);
    ScaffoldMessenger.maybeOf(context)?.showSnackBar(const SnackBar(
      content: Text("Invoice Generated"),
    ));
    await Future.delayed(const Duration(seconds: 3), () {
      homeCNT.currentIndex.value = 1;
      Get.off(() => const HomeView(), binding: HomeBinding());
    });

    print.call(invoice);
  }
}
