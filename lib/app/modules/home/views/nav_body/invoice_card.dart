import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_payment/app/modules/home/controllers/invoce_controller.dart';
import 'package:flutter_payment/app/utils/colors.dart';

class InvoiceAddCard extends GetView<InvoiceController> {
  final String description;
  final String price;
  final int index;

  const InvoiceAddCard({
    required this.description,
    required this.price,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: width,
      child: Card(
        elevation: 10,
        shadowColor: AppColors.color2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ITEM ${index + 1}",
                style: textTheme.bodyLarge,
              ),
              TextFormField(
                // controller: description,
                validator: (description) {
                  if (description!.isEmpty) {
                    return "Add Item description";
                  }
                  return null;
                },
                onChanged: (value) {
                  controller.items[index][0] = value;
                },
                decoration: const InputDecoration(
                  hintText: "Item Description",
                ),
              ),
              TextFormField(
                // controller: price,
                decoration: const InputDecoration(
                  hintText: "Price",
                ),
                onChanged: (value) {
                  controller.items[index][1] = value;
                },
                validator: (price) {
                  if (price!.isEmpty) {
                    return "Add Item description";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 5),
              ElevatedButton(
                onPressed: () {
                  if (controller.items.length != 1) {
                    controller.items.removeAt(index);
                  } else {
                    ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                      const SnackBar(content: Text("Could not delete")),
                    );
                  }
                },
                child: const Text("Delete"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
