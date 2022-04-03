import 'package:flutter/material.dart';
import 'package:flutter_payment/app/modules/home/bindings/home_binding.dart';
import 'package:flutter_payment/app/modules/home/views/actions_view/request_a_payment.dart';
import 'package:get/get.dart';

class BottomAction {
  static List<Map<String, IconData>> actionsNameStyle = [
    {"Manage Currencies": Icons.money},
    {"Pay to recipient's account": Icons.account_balance},
    {"Pay to recipient's bank account": Icons.receipt_rounded},
    {"Request a payment": Icons.request_page_outlined},
    {"Pay a payment request": Icons.volunteer_activism},
    {"Withdraw to Bank": Icons.account_balance_wallet},
  ];

  static onTapAction(int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        {
          Get.back();
          Get.to(() => const RequestAPayment(), binding: HomeBinding());
          break;
        }
      case 4:
        break;
      case 5:
        break;
    }
  }

  BottomAction._();
}
