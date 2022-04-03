import 'package:flutter/material.dart';
import 'package:flutter_payment/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_payment/app/utils/colors.dart';
import 'package:flutter_payment/app/utils/constants.dart';
import 'package:flutter_payment/model/transaction_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransActionDetailsView extends GetView<HomeController> {
  const TransActionDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TransactionModel transaction = Get.arguments as TransactionModel;
    final width = MediaQuery.of(context).size.width;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final title1 = textTheme.headline6
        ?.copyWith(fontSize: 17, fontWeight: FontWeight.bold);
    final title2 = textTheme.headline6
        ?.copyWith(fontSize: 16, fontWeight: FontWeight.w500);
    final subText = textTheme.headline6
        ?.copyWith(fontSize: 16, fontWeight: FontWeight.normal);

    DateFormat formatDate = DateFormat('dd MMMM yyyy');

    return Scaffold(
      appBar: AppBar(
        title: Text("Transaction  ${transaction.transactionId}"),
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
                          child: Image.asset(AppImages.cashTransaction),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '${transaction.payment} USD',
                          style: textTheme.headline5,
                        ),
                        Text(
                          formatDate.format(transaction.paymentRequestDueDate),
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
              Text(transaction.payment.toString() + " USD", style: subText),
              const SizedBox(height: 10),
              Text('Fee', style: title2),
              Text('${transaction.fee} USD', style: subText),
              const SizedBox(height: 10),
              Text('Recipient gets', style: title2),
              Text('${transaction.recipientGets} USD', style: subText),
              const Divider(thickness: 1.5),
              Text('Transaction details', style: title1),
              const SizedBox(height: 5),
              Text('Transaction ID', style: title2),
              Text(transaction.transactionId.toString(), style: subText),
              const SizedBox(height: 10),
              Text('To', style: title2),
              Text(transaction.recipientEmail, style: subText),
              const SizedBox(height: 10),
              Text('Payment request ID', style: title2),
              Text(transaction.paymentRequestId.toString(), style: subText),
              const SizedBox(height: 10),
              Text('Payment request due date', style: title2),
              Text(formatDate.format(transaction.paymentRequestDueDate),
                  style: subText),
              const SizedBox(height: 10),
              Text('Description', style: title2),
              Text(transaction.description, style: subText),
              const Divider(thickness: 1.5),
              Text('Transaction Timeline', style: title1),
              const SizedBox(height: 5),
              Text('Received by recipient', style: title2),
              Text(formatDate.format(transaction.receivedByRecipient),
                  style: subText),
              const SizedBox(height: 10),
              Text('Completed', style: title2),
              Text(formatDate.format(transaction.createAt), style: subText),
              const SizedBox(height: 10),
              Text('Processing', style: title2),
              Text(formatDate.format(transaction.processing), style: subText),
              const SizedBox(height: 40),
              // ListView(
              //   physics: const NeverScrollableScrollPhysics(),
              //   shrinkWrap: true,
              //   children: <Widget>[
              //     const Center(
              //         child: Text(
              //       'Item Info',
              //       style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              //     )),
              //     DataTable(
              //       columns: const [
              //         DataColumn(
              //             label: Text('ID',
              //                 style: TextStyle(
              //                     fontSize: 18, fontWeight: FontWeight.bold))),
              //         DataColumn(
              //             label: Text('Description',
              //                 style: TextStyle(
              //                     fontSize: 18, fontWeight: FontWeight.bold))),
              //         DataColumn(
              //             label: Text('Price',
              //                 style: TextStyle(
              //                     fontSize: 18, fontWeight: FontWeight.bold))),
              //       ],
              //       rows: [
              //         ...List.generate(
              //           invoice.items.length,
              //           (index) => DataRow(cells: [
              //             DataCell(Text('${index + 1}')),
              //             DataCell(Text(invoice.items[index][0])),
              //             DataCell(Text(invoice.items[index][1])),
              //           ]),
              //         ),
              //         DataRow(cells: [
              //           const DataCell(Text('#')),
              //           const DataCell(Text("Total")),
              //           DataCell(Text(getTotal())),
              //         ]),
              //       ],
              //     ),
              //   ],
              // ),

              const SizedBox(height: 10),

              const SizedBox(height: 90),
            ],
          ),
        ),
      ),
    );
  }
}
