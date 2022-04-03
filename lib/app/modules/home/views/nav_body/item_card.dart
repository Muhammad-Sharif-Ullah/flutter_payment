
import 'package:flutter/material.dart';
import 'package:flutter_payment/app/utils/colors.dart';

class ItemCard extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final double padding;
  final String image;
  const ItemCard({
    Key? key,
    required this.onTap,
    required this.text,
    required this.padding,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: GridTile(
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Image.asset(image),
            ),
            footer: Container(
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.color7.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Center(
                    child: Text(
                  text,
                  style: const TextStyle(color: Colors.black),
                )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
