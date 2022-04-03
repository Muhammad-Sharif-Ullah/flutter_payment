import 'package:flutter/material.dart';
import 'package:flutter_payment/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_payment/app/utils/colors.dart';
import 'package:flutter_payment/app/utils/constants.dart';
import 'package:flutter_payment/model/request_a_payment_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timelines/timelines.dart';

class RequestedPaymentDetailsView extends GetView<HomeController> {
  const RequestedPaymentDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RequestAPaymentModel requestedPayment =
        Get.arguments as RequestAPaymentModel;
    final width = MediaQuery.of(context).size.width;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final title1 = textTheme.headline6
        ?.copyWith(fontSize: 17, fontWeight: FontWeight.bold);

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

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pay a payment request"),
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
      body: Stack(
        children: [
          DefaultTabController(
            length: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
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
                              '${requestedPayment.payment} USD',
                              style: textTheme.headline5,
                            ),
                            Text(
                              "Request " + getStatus(requestedPayment.status),
                              style: textTheme.bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const TabBar(
                    indicatorColor: AppColors.color6,
                    labelColor: AppColors.color6,
                    unselectedLabelColor: Colors.black,
                    indicatorWeight: 4,
                    tabs: [
                      Tab(
                        text: "Timeline",
                      ),
                      Tab(
                        text: "Details",
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Timeline.tileBuilder(
                          theme: TimelineThemeData.fallback(),
                          builder: TimelineTileBuilder.fromStyle(
                            contentsAlign: ContentsAlign.basic,
                            contentsBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Column(
                                children: [
                                  Text(
                                    requestedPayment.timeLine[index][0] != null
                                        ? formatDate.format(
                                            requestedPayment.timeLine[index][0])
                                        : "",
                                  ),
                                  Text(requestedPayment.timeLine[index][1])
                                ],
                              ),
                            ),
                            itemCount: requestedPayment.timeLine.length,
                          ),
                        ),
                        DetailsWidget(
                          title1: title1,
                          requestedPayment: requestedPayment,
                          subText: subText,
                          formatDate: formatDate,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 90),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 80,
                width: width,
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                            const SnackBar(
                              content: Text("This feature not implemented yet"),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        },
                        icon: const Icon(Icons.close),
                        label: const Text("CANCEL"),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                            const SnackBar(
                              content: Text("This feature not implemented yet"),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        },
                        icon: const Icon(Icons.volunteer_activism),
                        label: const Text("PAY"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({
    Key? key,
    required this.title1,
    required this.requestedPayment,
    required this.subText,
    required this.formatDate,
  }) : super(key: key);

  final TextStyle? title1;
  final RequestAPaymentModel requestedPayment;
  final TextStyle? subText;
  final DateFormat formatDate;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExpansionTile(
            initiallyExpanded: true,
            title: const Text("Request details"),
            children: [
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Request ID', style: title1),
              ),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.centerLeft,
                child:
                    Text(requestedPayment.requestId.toString(), style: subText),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Request Sent', style: title1),
              ),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(formatDate.format(requestedPayment.requestSent),
                    style: subText),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Due By', style: title1),
              ),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(formatDate.format(requestedPayment.requestSent),
                    style: subText),
              ),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Description', style: title1),
              ),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(requestedPayment.description, style: subText),
              ),
            ],
          ),
          const SizedBox(height: 40),
          ExpansionTile(
            initiallyExpanded: true,
            title: const Text("Payment details"),
            children: [
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Available payment methods', style: title1),
              ),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(requestedPayment.paymentMethod, style: subText),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Payment link', style: title1),
              ),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(requestedPayment.paymentLink, style: subText),
              ),
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
