import 'package:flutter/material.dart';
import 'package:flutter_payment/app/modules/home/views/actions_view/request_pyment/payment_details.dart';
import 'package:flutter_payment/app/modules/home/views/actions_view/request_pyment/payment_success.dart';
import 'package:flutter_payment/app/modules/home/views/actions_view/request_pyment/select_payer.dart';
import 'package:flutter_payment/app/modules/home/views/actions_view/request_pyment/select_payment_method.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RequestAPayController extends GetxController {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final currentView = 0.obs;
  final PageController pageController = PageController(initialPage: 0);
  final TextEditingController amount = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController paymentAs = TextEditingController();
  final TextEditingController companyName = TextEditingController();
  final TextEditingController webSiteURl = TextEditingController();
  final TextEditingController contactFirstName = TextEditingController();
  final TextEditingController contactLastName = TextEditingController();
  final TextEditingController email = TextEditingController();

  final paymentDetailsFormKey = GlobalKey<FormState>();
  Rx<DateTime> selectedDate = DateTime.now().obs;
  RxBool isClickNewPayer = false.obs;

  RxInt paymentMethod = 0.obs;
  RxBool isAddMoneyClick = false.obs;

  final List<Widget> reqPaymentWidgets = [
    const SelectPayerWidget(),
    const PaymentDetailsWidget(),
    const SelectPaymentMethod(),
    const PaymentSuccess()
  ];

  final List<Map<IconData, String>> newPayerSelection = [
    {Icons.account_balance: "Company"},
    {Icons.person: "Individual"},
  ];
  RxInt newPayerIndex = 0.obs;
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

  selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate.value) {
      selectedDate.value = selected;
    }
  }
}
