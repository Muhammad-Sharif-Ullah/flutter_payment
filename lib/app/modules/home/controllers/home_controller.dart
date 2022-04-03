import 'package:flutter/cupertino.dart';
import 'package:flutter_payment/app/data/app_data.dart';
import 'package:flutter_payment/app/modules/home/views/invoce_page.dart';
import 'package:flutter_payment/app/modules/home/views/nav_body/home_body.dart';
import 'package:flutter_payment/app/modules/home/views/nav_body/more_body.dart';
import 'package:flutter_payment/app/modules/home/views/nav_body/transaction_body.dart';
import 'package:flutter_payment/model/invoice_model.dart';
import 'package:flutter_payment/model/request_a_payment_model.dart';
import 'package:flutter_payment/model/transaction_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final currentIndex = 0.obs;

  final List<Widget> bodyWidgets = [
    const HomeBody(),
    const InvoicePage(),
    const TransactionBody(),
    const MoreBody(),
  ];

  RxList<InvoiceModel> invoices = AppData.invoices.obs;
  RxList<TransactionModel> transaction = AppData.transAction.obs;
  RxList<RequestAPaymentModel> requestedPayment = AppData.requestAPayment.obs;
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
}
