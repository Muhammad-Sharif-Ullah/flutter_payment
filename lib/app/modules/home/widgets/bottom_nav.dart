import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_payment/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_payment/app/modules/home/views/invoce_page.dart';
import 'package:flutter_payment/app/modules/home/widgets/bottom_action.dart';
import 'package:get/get.dart';

class BottomNavBarWidget extends GetWidget<HomeController> {
  const BottomNavBarWidget({Key? key}) : super(key: key);

  final primaryColor = const Color(0xff4338CA);
  final secondaryColor = const Color(0xff6D28D9);
  final accentColor = const Color(0xffffffff);
  final backgroundColor = const Color(0xffffffff);
  final errorColor = const Color(0xffEF4444);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BottomAppBar(
      color: Colors.white,
      child: SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => IconBottomBar(
                  text: "Home",
                  icon: Icons.account_balance_wallet,
                  selected: controller.currentIndex.value == 0,
                  onPressed: () => controller.currentIndex.value = 0,
                ),
              ),
              Obx(
                () => IconBottomBar(
                  text: "Invoices",
                  icon: CupertinoIcons.chart_bar_circle,
                  selected: controller.currentIndex.value == 1,
                  onPressed: () {
                    controller.currentIndex.value = 1;
                    Get.to(() => const InvoicePage());
                  },
                ),
              ),
              Obx(() => IconBottomBar(
                    text: "Transaction",
                    icon: CupertinoIcons.arrow_right_arrow_left,
                    selected: controller.currentIndex.value == 3,
                    onPressed: () {
                      controller.currentIndex.value = 3;
                    },
                  )),
              Obx(
                () => IconBottomBar(
                  text: "More",
                  icon: Icons.more,
                  selected: controller.currentIndex.value == 2,
                  onPressed: () {
                    controller.currentIndex.value = 2;
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => SizedBox(
                        height: height * .5,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ListView.separated(
                            itemCount: BottomAction.actionsNameStyle.length + 1,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              final action =
                                  BottomAction.actionsNameStyle[index];
                              final icon = action.values.first;
                              final string = action.keys.first;
                              return ListTile(
                                dense: true,
                                onTap: () => BottomAction.onTapAction(index),
                                leading: Icon(icon),
                                title: Text(string),
                              );
                            },
                            itemBuilder: (BuildContext context, int index) {
                              if (index == 0) return Container();
                              return const Divider(thickness: 1.5);
                            },
                          ),
                        ),
                      ),
                    );
                    controller.currentIndex.value = 0;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  final primaryColor = const Color(0xff4338CA);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 25,
            color: selected ? primaryColor : Colors.black54,
          ),
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 12,
              height: .1,
              color: selected ? primaryColor : Colors.grey.withOpacity(.75)),
        )
      ],
    );
  }
}
