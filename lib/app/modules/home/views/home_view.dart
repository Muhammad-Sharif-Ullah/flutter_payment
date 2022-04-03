import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_payment/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_payment/app/utils/colors.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.bodyWidgets[controller.currentIndex.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.black,
            backgroundColor: AppColors.color7,
            onTap: (index) {
              print.call(index);
              controller.currentIndex.value = index;
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                backgroundColor: AppColors.color7,
                icon: Icon(Icons.account_balance_wallet),
                label: "Home",
              ),
              BottomNavigationBarItem(
                backgroundColor: AppColors.color7,
                label: "Invoices",
                icon: Icon(CupertinoIcons.chart_bar_circle),
              ),
              BottomNavigationBarItem(
                backgroundColor: AppColors.color7,
                label: "Transaction",
                icon: Icon(CupertinoIcons.arrow_right_arrow_left),
              ),
              BottomNavigationBarItem(
                backgroundColor: AppColors.color7,
                label: "More",
                icon: Icon(Icons.more),
              ),
            ],
          )),
    );
  }
}
