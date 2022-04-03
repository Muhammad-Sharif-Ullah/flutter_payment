import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_payment/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_payment/app/modules/home/views/nav_body/transaction_details_view.dart';
import 'package:flutter_payment/app/utils/colors.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeTransactionHistory extends GetView<HomeController> {
  const HomeTransactionHistory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final DateFormat dateFormat = DateFormat('hh:mm a');
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Text(
                "Transaction History",
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
                final transaction = controller.transaction[index];
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
                        Get.to(() => const TransActionDetailsView(),
                            arguments: transaction);
                      },
                      leading: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: transaction.isDeposited
                                ? [Colors.greenAccent, Colors.tealAccent]
                                : [
                                    const Color(0xFFFE8182),
                                    const Color(0xFFFB9F82),
                                  ],
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: Icon(
                            transaction.isDeposited
                                ? Icons.arrow_upward
                                : Icons.arrow_downward,
                            color: transaction.isDeposited
                                ? Colors.greenAccent
                                : Colors.redAccent,
                          ),
                        ),
                      ),
                      title: Text(transaction.recipientName),
                      subtitle: Row(
                        children: [
                          Text("\$ ${transaction.payment} "),
                          const SizedBox(width: 6),
                          const CircleAvatar(
                            radius: 4,
                            backgroundColor: AppColors.color5,
                          ),
                          const SizedBox(width: 6),
                          Text(dateFormat.format(transaction.createAt)),
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
              itemCount: controller.transaction.length,
            ),
          ),
        )
      ],
    );
  }
}
