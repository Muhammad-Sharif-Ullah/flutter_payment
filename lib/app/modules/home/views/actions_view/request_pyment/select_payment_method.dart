import 'package:flutter/material.dart';
import 'package:flutter_payment/app/modules/home/controllers/request_a_pay_controller.dart';
import 'package:flutter_payment/app/utils/colors.dart';
import 'package:flutter_payment/app/utils/constants.dart';
import 'package:get/get.dart';

class SelectPaymentMethod extends GetWidget<RequestAPayController> {
  const SelectPaymentMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 3,
        shadowColor: AppColors.color1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    width: 5,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(width: 20),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 3, bottom: 5, right: 10, left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Payment Method',
                            style: textTheme.bodyText1?.copyWith(
                              fontSize: 20,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: SizedBox(
                              height: 60,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                  AppImages.payment.length,
                                  (index) => Expanded(
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(10),
                                      onTap: () => controller
                                          .paymentMethod.value = index,
                                      child: Obx(() => SizedBox(
                                            width: width * .3,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Container(
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    width: 1,
                                                    color: controller
                                                                .paymentMethod
                                                                .value ==
                                                            index
                                                        ? AppColors.color5
                                                        : Colors.transparent,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Image.asset(
                                                  AppImages.payment[index],
                                                ),
                                              ),
                                            ),
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),
                          const Divider(thickness: 2),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: width * .3,
                                child: OutlinedButton(
                                  onPressed: () {
                                    controller.pageController.previousPage(
                                      duration:
                                          const Duration(milliseconds: 600),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  child: const Text("Previous"),
                                ),
                              ),
                              SizedBox(
                                width: width * .3,
                                child: ElevatedButton(
                                  onPressed: () {
                                    controller.pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 600),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  child: const Text('Next'),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
