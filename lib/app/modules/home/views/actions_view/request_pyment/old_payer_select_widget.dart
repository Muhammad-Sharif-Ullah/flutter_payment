import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_payment/app/modules/home/controllers/request_a_pay_controller.dart';
import 'package:get/get.dart';

class OldPayerSelectWidget extends GetWidget<RequestAPayController> {
  const OldPayerSelectWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Select payer',
                style: textTheme.bodyText1?.copyWith(
                  fontSize: 20,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () => controller.isClickNewPayer.toggle(),
                child: const Text('Add New Payer'),
              )
            ],
          ),
          const Divider(thickness: 1),
          const TextField(),
          const SizedBox(height: 10),
          Text(
            'Most Recent',
            style: textTheme.bodyText1?.copyWith(
              fontSize: 13,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 5),
          ListView.separated(
            shrinkWrap: true,
            itemCount: 5,
            separatorBuilder: (BuildContext context, int index) {
              return RawMaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                fillColor: const Color(0xFFF2F3F6),
                onPressed: () {
                  // controller.pageController.nextPage(
                  //   duration: const Duration(milliseconds: 600),
                  //   curve: Curves.easeInOut,
                  // );
                },
                elevation: .4,
                child: const ListTile(
                  dense: true,
                  leading: Icon(CupertinoIcons.person_alt_circle),
                  title: Text("Smart Sharif"),
                  subtitle: Text('sharnkbd@gmail.com'),
                ),
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 5);
            },
          ),
          const Divider(thickness: 2),
          const SizedBox(height: 5),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: width * .3,
              child: ElevatedButton(
                onPressed: () {
                  controller.pageController.nextPage(
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeInOut,
                  );
                },
                child: const Text('Next'),
              ),
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
