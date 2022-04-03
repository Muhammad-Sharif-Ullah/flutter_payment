import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_payment/app/modules/home/views/profile_view.dart';
import 'package:flutter_payment/app/utils/colors.dart';
import 'package:flutter_payment/app/utils/constants.dart';
import 'package:get/get.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({
    Key? key,
    required this.width,
    required this.textTheme,
  }) : super(key: key);

  final double width;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: SizedBox(
        // height: 300,
        width: width,
        child: Material(
          color: Colors.transparent,
          elevation: 30,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [AppColors.color4, AppColors.color6],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Md. Sharif Ullah',
                        style: textTheme.headline6?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          CupertinoIcons.bell,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () => Get.to(()=> const UserProfile()),
                        icon: const Icon(
                          CupertinoIcons.person,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    // height: 100,
                    width: width,
                    child: Card(
                      elevation: 5,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  AppImages.usFlag,
                                  height: 30,
                                  width: 30,
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  "USD balance",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black38,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "1000.00 USD",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
