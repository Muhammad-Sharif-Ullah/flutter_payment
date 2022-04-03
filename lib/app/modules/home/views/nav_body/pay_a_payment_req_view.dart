import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_payment/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_payment/app/modules/home/views/requested_payment_details.dart';
import 'package:flutter_payment/app/utils/colors.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PayAPaymentRequest extends GetView<HomeController> {
  const PayAPaymentRequest({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final DateFormat dateFormat = DateFormat('hh:mm a');

    List<Color> getStatusColor(int status) {
      if (status == 0) {
        return [Colors.yellowAccent, Colors.amberAccent];
      } else if (status == 1) {
        return [Colors.greenAccent, Colors.tealAccent];
      }
      return [const Color(0xFFFE8182), const Color(0xFFFB9F82)];
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("All Payment Request"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.color4, AppColors.color6],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text(
                  "Payment Request",
                  style: textTheme.bodyText1?.copyWith(fontSize: 15),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.separated(
                padding: const EdgeInsets.all(0),
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final requestedPay = controller.requestedPayment[index];
                  return SizedBox(
                    width: width,
                    child: Card(
                      elevation: 5,
                      shadowColor: AppColors.color1.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        onTap: () {
                          Get.to(() => const RequestedPaymentDetailsView(),
                              arguments: requestedPay);
                        },
                        leading: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: getStatusColor(requestedPay.status),
                            ),
                          ),
                          child: const CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        title: Text(requestedPay.description),
                        subtitle: Row(
                          children: [
                            Text("\$ ${requestedPay.payment} "),
                            const SizedBox(width: 6),
                            const CircleAvatar(
                              radius: 4,
                              backgroundColor: AppColors.color5,
                            ),
                            const SizedBox(width: 6),
                            Text(dateFormat.format(requestedPay.requestSent)),
                          ],
                        ),
                        trailing: const Icon(
                          CupertinoIcons.arrow_right_square,
                          color: AppColors.color5,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: controller.requestedPayment.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
