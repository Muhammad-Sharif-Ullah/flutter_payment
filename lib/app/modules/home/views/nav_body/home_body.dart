import 'package:flutter/material.dart';
import 'package:flutter_payment/app/modules/home/bindings/home_binding.dart';
import 'package:flutter_payment/app/modules/home/views/nav_body/add_money_view.dart';
import 'package:flutter_payment/app/modules/home/views/nav_body/generate_invoice_view.dart';
import 'package:flutter_payment/app/modules/home/views/nav_body/item_card.dart';
import 'package:get/get.dart';

import 'package:flutter_payment/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_payment/app/modules/home/widgets/home_header.dart';
import 'package:flutter_payment/app/utils/constants.dart';

class HomeBody extends GetWidget<HomeController> {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HomeHeaderWidget(width: width, textTheme: textTheme),
          const SizedBox(height: 1),
          // HomeTransactionHistory(textTheme: textTheme, width: width),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: <Widget>[
                  ItemCard(
                    text: "Add Money",
                    onTap: () => Get.to(
                      () => const AddMoney(),
                      binding: HomeBinding(),
                    ),
                    image: AppImages.addMoney,
                    padding: 35,
                  ),
                  ItemCard(
                    text: "Generate Invoice",
                    onTap: () => Get.to(
                      () => const GenerateInvoicePage(),
                      binding: HomeBinding(),
                    ),
                    image: AppImages.invoice,
                    padding: 40,
                  ),
                  ItemCard(
                    text: "Transaction",
                    onTap: () {
                      controller.currentIndex.value = 2;
                    },
                    image: AppImages.transaction,
                    padding: 30,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
