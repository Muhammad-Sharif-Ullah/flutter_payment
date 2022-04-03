import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_payment/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_payment/app/utils/colors.dart';
import 'package:flutter_payment/app/utils/constants.dart';
import 'package:flutter_payment/model/invoice_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class InvoiceDetailsView extends GetView<HomeController> {
  const InvoiceDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final InvoiceModel invoice = Get.arguments as InvoiceModel;
    final width = MediaQuery.of(context).size.width;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final title1 = textTheme.headline6
        ?.copyWith(fontSize: 17, fontWeight: FontWeight.bold);
    final title2 = textTheme.headline6
        ?.copyWith(fontSize: 16, fontWeight: FontWeight.w500);
    final subText = textTheme.headline6
        ?.copyWith(fontSize: 16, fontWeight: FontWeight.normal);

    DateFormat formatDate = DateFormat('dd MMMM yyyy');

    String getStatus(int status) {
      if (status == 0) {
        return "Pending";
      } else if (status == 1) {
        return "Success";
      }
      return "Cancel";
    }

    getTotal() {
      double total = 0.0;
      for (int i = 0; i < invoice.items.length; i++) {
        total += double.parse(invoice.items[i][1]);
      }
      // print.call(total);
      return total.toString();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Invoice"),
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              SizedBox(
                width: width,
                child: Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                          child: Image.asset(AppImages.invoice),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '${invoice.payment} USD',
                          style: textTheme.headline5,
                        ),
                        Text(
                          getStatus(invoice.status),
                          style: textTheme.bodyLarge,
                        ),
                        Text(
                          formatDate.format(invoice.paymentRequestDueDate),
                          style: textTheme.headline6,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text('Summary', style: title1),
              const SizedBox(height: 5),
              Text('Payment Amount', style: title2),
              Text(invoice.payment.toString() + " USD", style: subText),
              const SizedBox(height: 10),
              Text('Fee', style: title2),
              Text('${invoice.fee} USD', style: subText),
              const SizedBox(height: 10),
              Text('Recipient gets', style: title2),
              Text('${invoice.recipientGets} USD', style: subText),
              const Divider(thickness: 1.5),
              Text('Transaction details', style: title1),
              const SizedBox(height: 5),
              Text('Transaction ID', style: title2),
              Text(invoice.transactionId.toString(), style: subText),
              const SizedBox(height: 10),
              Text('To', style: title2),
              Text(invoice.recipientEmail, style: subText),
              const SizedBox(height: 10),
              Text('Payment request ID', style: title2),
              Text(invoice.paymentRequestId.toString(), style: subText),
              const SizedBox(height: 10),
              Text('Payment request due date', style: title2),
              Text(formatDate.format(invoice.paymentRequestDueDate),
                  style: subText),
              const SizedBox(height: 10),
              Text('Description', style: title2),
              Text(invoice.description, style: subText),
              const Divider(thickness: 1.5),
              Text('Transaction Timeline', style: title1),
              const SizedBox(height: 5),
              Text('Received by recipient', style: title2),
              Text(formatDate.format(invoice.receivedByRecipient),
                  style: subText),
              const SizedBox(height: 10),
              Text('Completed', style: title2),
              Text(formatDate.format(invoice.createAt), style: subText),
              const SizedBox(height: 10),
              Text('Processing', style: title2),
              Text(formatDate.format(invoice.processing), style: subText),
              const SizedBox(height: 40),
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  const Center(
                      child: Text(
                    'Item Info',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )),
                  DataTable(
                    columns: const [
                      DataColumn(
                          label: Text('ID',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))),
                      DataColumn(
                          label: Text('Description',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))),
                      DataColumn(
                          label: Text('Price',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))),
                    ],
                    rows: [
                      ...List.generate(
                        invoice.items.length,
                        (index) => DataRow(cells: [
                          DataCell(Text('${index + 1}')),
                          DataCell(Text(invoice.items[index][0])),
                          DataCell(Text(invoice.items[index][1])),
                        ]),
                      ),
                      DataRow(cells: [
                        const DataCell(Text('#')),
                        const DataCell(Text("Total")),
                        DataCell(Text(getTotal())),
                      ]),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.redAccent,
                      ),
                      onPressed: () {},
                      child: const Text("Delete"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(CupertinoIcons.share),
                      onPressed: () {},
                      label: const Text("Share Invoice"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 90),
            ],
          ),
        ),
      ),
    );
  }
}
