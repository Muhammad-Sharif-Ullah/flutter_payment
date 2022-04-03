import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_payment/app/utils/colors.dart';
import 'package:flutter_payment/app/utils/constants.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final title1 = textTheme.headline6
        ?.copyWith(fontSize: 17, fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Center(
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage(AppImages.avatar),
              ),
            ),
            const SizedBox(height: 10),
            Text('Alfie Brown', style: title1),
            const SizedBox(height: 15),
            const InfoTile(title: 'User name : ', text: "Dooloverity"),
            const SizedBox(height: 5),
            const InfoTile(title: 'Email : ', text: "AlfieBrown@rhyta.com"),
            const SizedBox(height: 5),
            const InfoTile(
                title: 'Address : ',
                text: "13 Marlborough Crescent SOUTH WIDCOMBE BS18 0SR"),
            const SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.color3,
                    ),
                    onPressed: () {},
                    child: const Text("Edit"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(CupertinoIcons.share),
                    onPressed: () {},
                    label: const Text("Shareable link"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final String title;
  final String text;

  const InfoTile({Key? key, required this.title, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final title2 = textTheme.headline6
        ?.copyWith(fontSize: 16, fontWeight: FontWeight.w500);
    final subText = textTheme.headline6
        ?.copyWith(fontSize: 16, fontWeight: FontWeight.normal);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: title2?.copyWith(color: Colors.black87)),
        Flexible(child: Text(text, style: subText)),
      ],
    );
  }
}
