import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_payment/app/modules/home/controllers/request_a_pay_controller.dart';
import 'package:flutter_payment/app/utils/colors.dart';
import 'package:get/get.dart';

class PaymentDetailsWidget extends GetWidget<RequestAPayController> {
  const PaymentDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: controller.paymentDetailsFormKey,
        child: Card(
          elevation: 3,
          shadowColor: AppColors.color1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                              'Payment Details',
                              style: textTheme.bodyText1?.copyWith(
                                fontSize: 20,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Divider(thickness: 1),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextFormField(
                                        keyboardType: const TextInputType
                                            .numberWithOptions(decimal: true),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp('[0-9.,]+')),
                                        ],
                                        validator: (amount) {
                                          if (amount!.isEmpty) {
                                            return "Please enter some amount";
                                          } else if (double.parse(amount) <
                                                  20.00 ||
                                              double.parse(amount) > 15000.00) {
                                            return "Range should be 20.00-15,000.00 USD";
                                          }
                                          return null;
                                        },
                                        controller: controller.amount,
                                        decoration: const InputDecoration(
                                          labelText: "Amount",
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        '20.00-15,000.00 USD',
                                        style: textTheme.bodyText1?.copyWith(
                                          fontSize: 12,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              validator: (description) {
                                if (description!.isEmpty) {
                                  return "Please type some description";
                                }
                                return null;
                              },
                              controller: controller.description,
                              decoration: const InputDecoration(
                                hintText: "Some Transaction Description",
                                labelText: "Description",
                              ),
                              maxLength: 200,
                            ),
                            const SizedBox(height: 10),
                            const SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Payment due by',
                                  style: textTheme.bodyText1?.copyWith(
                                    // fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                InkWell(
                                  onTap: () {
                                    controller.selectDate(context);
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Obx(() => Text(controller.formatter
                                              .format(controller
                                                  .selectedDate.value))),
                                          const Icon(CupertinoIcons.calendar),
                                        ],
                                      ),
                                      const Divider(thickness: 2),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: controller.paymentAs,
                              decoration: const InputDecoration(
                                hintText: "UI/UX Designer",
                                labelText: 'Request payment as',
                              ),
                              validator: (description) {
                                if (description!.isEmpty) {
                                  return "Please type some description";
                                }
                                return null;
                              },
                              maxLength: 200,
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
                                      if (controller
                                          .paymentDetailsFormKey.currentState!
                                          .validate()) {
                                        controller.pageController.nextPage(
                                          duration:
                                              const Duration(milliseconds: 600),
                                          curve: Curves.easeInOut,
                                        );
                                      }
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
      ),
    );
  }
}
