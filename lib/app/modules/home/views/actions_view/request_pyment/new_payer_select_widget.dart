import 'package:flutter/material.dart';
import 'package:flutter_payment/app/modules/home/controllers/request_a_pay_controller.dart';
import 'package:get/get.dart';

class NewPayerSelectWidget extends GetWidget<RequestAPayController> {
  const NewPayerSelectWidget({
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
          Text(
            'Enter payer details',
            style: textTheme.bodyText1?.copyWith(
              fontSize: 20,
              color: Colors.black54,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Divider(thickness: 1),
          const SizedBox(height: 5),
          ...List.generate(controller.newPayerSelection.length, (index) {
            return Obx(() => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: ListTile(
                    dense: true,
                    onTap: () => controller.newPayerIndex.value = index,
                    title: Text(
                      controller.newPayerSelection[index].entries.first.value,
                      style: TextStyle(
                        color: controller.newPayerIndex.value == index
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    tileColor: controller.newPayerIndex.value == index
                        ? const Color(0xFF515C6F)
                        : const Color(0xFFF2F3F6),
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(controller
                          .newPayerSelection[index].entries.first.key),
                    ),
                  ),
                ));
          }),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: TextFormField(
              controller: controller.companyName,
              decoration: const InputDecoration(
                hintText: "Company Name",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: TextFormField(
              controller: controller.webSiteURl,
              decoration: const InputDecoration(
                hintText: "Website URL",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: TextFormField(
              controller: controller.contactFirstName,
              decoration: const InputDecoration(
                hintText: "Contact First Name",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: TextFormField(
              controller: controller.contactLastName,
              decoration: const InputDecoration(
                hintText: "Contact Last Name",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                hintText: "Email",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 40,
              width: width,
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
