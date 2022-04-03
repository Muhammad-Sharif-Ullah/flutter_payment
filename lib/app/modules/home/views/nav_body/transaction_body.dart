import 'package:flutter/material.dart';
import 'package:flutter_payment/app/modules/home/widgets/home_transaction_history.dart';
import 'package:flutter_payment/app/utils/colors.dart';

class TransactionBody extends StatelessWidget {
  const TransactionBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transaction Details"),
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
      body: const HomeTransactionHistory(),
    );
  }
}
