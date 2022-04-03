import 'package:flutter/material.dart';
import 'package:flutter_payment/app/modules/home/controllers/request_a_pay_controller.dart';
import 'package:flutter_payment/app/utils/colors.dart';
import 'package:get/get.dart';

class PaymentSuccess extends GetWidget<RequestAPayController> {
  const PaymentSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "SUBMITTED",
              style: textTheme.bodyLarge?.copyWith(
                fontSize: 20,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              "Payment request 754546 was sent to User Name",
              style: textTheme.bodyLarge?.copyWith(
                fontSize: 13.5,
                color: Colors.black54,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Divider(
            thickness: 1,
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              "What Next?",
              style: textTheme.bodyLarge?.copyWith(
                fontSize: 17.5,
                color: Colors.black54,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: FittedBox(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text("Manage Payment Request"),
                  ),
                ),
              ),
              Expanded(
                child: FittedBox(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text("Request Another Payment"),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Text(
            "Share direct link with your payer",
            style: textTheme.bodyLarge?.copyWith(
              fontSize: 17.5,
              color: Colors.black54,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: width,
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                  primary: AppColors.color5, padding: const EdgeInsets.all(10)),
              icon: const Icon(Icons.share),
              onPressed: () {},
              label: const Text('Share Link'),
            ),
          ),
        ],
      ),
    );
  }
}
