import 'package:flutter/material.dart';
import 'package:flutter_payment/app/modules/home/controllers/invoce_controller.dart';
import 'package:flutter_payment/app/modules/home/views/nav_body/invoice_card.dart';
import 'package:flutter_payment/app/utils/colors.dart';
import 'package:get/get.dart';

class GenerateInvoicePage extends StatefulWidget {
  const GenerateInvoicePage({Key? key}) : super(key: key);

  @override
  State<GenerateInvoicePage> createState() => _GenerateInvoicePageState();
}

class _GenerateInvoicePageState extends State<GenerateInvoicePage> {
  final InvoiceController controller = Get.find<InvoiceController>();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Generate Invoice"),
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
      body: SizedBox(
        height: height,
        width: width,
        child: Form(
          key: controller.form,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Item Details",
                      style: textTheme.bodyLarge,
                    ),
                  ),
                  const SizedBox(height: 20),
                  GetX(
                    init: InvoiceController(),
                    builder: (InvoiceController controller) {
                      return Column(
                        children: List.generate(
                          controller.items.length,
                          (index) => Obx(
                            () => InvoiceAddCard(
                              description: controller.items[index][0],
                              price: controller.items[index][1],
                              index: index,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      controller.items.add(['', '']);
                      // setState(() {});
                      print.call(controller.items.length);
                    },
                    child: const Text('Add Another'),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Recipient Details",
                      style: textTheme.bodyLarge,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    // controller: description,
                    validator: (name) {
                      if (name!.isEmpty || name.length < 6) {
                        return "Please enter valid name";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      controller.name.value = value;
                    },
                    decoration: const InputDecoration(
                      hintText: "Recipient Full Name",
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    // controller: description,
                    validator: (email) {
                      if (!GetUtils.isEmail(email!)) {
                        return "Please enter valid email";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      controller.email.value = value;
                    },
                    decoration: const InputDecoration(
                      hintText: "Recipient Email",
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    // controller: description,
                    validator: (phone) {
                      if (!GetUtils.isPhoneNumber(phone!)) {
                        return "Please enter valid  phone";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      controller.phone.value = value;
                    },
                    decoration: const InputDecoration(
                      hintText: "Recipient Phone",
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    // controller: description,
                    validator: (address) {
                      if (address!.isEmpty) {
                        return "Please add address";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      controller.email.value = value;
                    },
                    decoration: const InputDecoration(
                      hintText: "Recipient Address",
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: width,
                    child: ElevatedButton(
                      onPressed: () {
                        if (controller.form.currentState!.validate()) {
                          controller.createInvoice(context);
                        }
                      },
                      child: const Text('Create Invoice'),
                    ),
                  ),
                  const SizedBox(height: 90),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
