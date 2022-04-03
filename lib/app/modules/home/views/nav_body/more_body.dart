import 'package:flutter/material.dart';
import 'package:flutter_payment/app/modules/home/bindings/home_binding.dart';
import 'package:flutter_payment/app/modules/home/views/nav_body/generate_invoice_view.dart';
import 'package:flutter_payment/app/modules/home/views/nav_body/pay_a_payment_req_view.dart';
import 'package:flutter_payment/app/modules/home/widgets/bottom_action.dart';
import 'package:flutter_payment/app/utils/colors.dart';
import 'package:get/get.dart';

class MoreBody extends StatelessWidget {
  const MoreBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("More"),
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.separated(
          itemCount: BottomAction.actionsNameStyle.length + 1,
          separatorBuilder: (BuildContext context, int index) {
            final action = BottomAction.actionsNameStyle[index].entries.first;
            return ListTile(
              leading: Icon(action.value),
              title: Text(action.key),
              onTap: () {
                switch (index) {
                  case 0:
                    ScaffoldMessenger.maybeOf(context)
                        ?.showSnackBar(const SnackBar(
                      content: Text("This feature not implemented yet"),
                      duration: Duration(seconds: 1),
                    ));
                    break;
                  case 1:
                    ScaffoldMessenger.maybeOf(context)
                        ?.showSnackBar(const SnackBar(
                      content: Text("This feature not implemented yet"),
                      duration: Duration(seconds: 1),
                    ));
                    break;
                  case 2:
                    ScaffoldMessenger.maybeOf(context)
                        ?.showSnackBar(const SnackBar(
                      content: Text("This feature not implemented yet"),
                      duration: Duration(seconds: 1),
                    ));
                    break;
                  case 3:
                    Get.to(() => const GenerateInvoicePage(),
                        binding: HomeBinding());
                    break;
                  case 4:
                    Get.to(() => const PayAPaymentRequest(),
                        binding: HomeBinding());
                    break;
                  case 5:
                    ScaffoldMessenger.maybeOf(context)
                        ?.showSnackBar(const SnackBar(
                      content: Text("This feature not implemented yet"),
                      duration: Duration(seconds: 1),
                    ));
                    break;
                }
              },
            );
          },
          itemBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 10);
          },
        ),
      ),
    );
  }
}
