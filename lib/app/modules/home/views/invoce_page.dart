import 'package:flutter/material.dart';
import 'package:flutter_payment/app/modules/home/bindings/home_binding.dart';
import 'package:flutter_payment/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_payment/app/modules/home/views/nav_body/generate_invoice_view.dart';
import 'package:flutter_payment/app/modules/home/views/nav_body/invoice_details_view.dart';
import 'package:flutter_payment/app/utils/colors.dart';
import 'package:get/get.dart';

class InvoicePage extends GetWidget<HomeController> {
  const InvoicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Color getStatusColor(int status) {
      if (status == 0) {
        return Colors.yellowAccent;
      } else if (status == 1) {
        return Colors.greenAccent;
      }
      return Colors.redAccent;
    }

    String getStatus(int status) {
      if (status == 0) {
        return "Pending";
      } else if (status == 1) {
        return "Success";
      }
      return "Cancel";
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.color4,
        onPressed: () {
          Get.to(() => const GenerateInvoicePage(), binding: HomeBinding());
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Invoices"),
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
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView.separated(
          itemCount: controller.invoices.length + 1,
          separatorBuilder: (BuildContext context, int index) {
            final invoice = controller.invoices[index];
            return RawMaterialButton(
              onPressed: () {
                Get.to(() => const InvoiceDetailsView(), arguments: invoice);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                width: width,
                child: Card(
                  elevation: 10,
                  shadowColor: AppColors.color2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Recipient Name : ${invoice.recipientName}"),
                        Text("Request By : ${invoice.creatorName}"),
                        Text('Payment Request ${invoice.createAt}'),
                        Text('Amount ${invoice.payment} USD'),
                        Row(
                          children: [
                            const Text('Status'),
                            const SizedBox(width: 10),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 1, color: AppColors.color3),
                              ),
                              child: CircleAvatar(
                                radius: 5,
                                backgroundColor: getStatusColor(invoice.status),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(getStatus(invoice.status)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
