import 'package:flutter/material.dart';
import 'package:flutter_payment/app/modules/home/controllers/request_a_pay_controller.dart';
import 'package:flutter_payment/app/modules/home/views/actions_view/request_pyment/old_payer_select_widget.dart';
import 'package:flutter_payment/app/utils/colors.dart';
import 'package:get/get.dart';

class SelectPayerWidget extends GetWidget<RequestAPayController> {
  const SelectPayerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Card(
      elevation: 3,
      shadowColor: AppColors.color1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      // child: ,
      child: SizedBox(
        height: height * .5,
        child: Row(
          children: const [
            OldPayerSelectWidget(),
          ],
        ),
      ),
    );
  }
}
