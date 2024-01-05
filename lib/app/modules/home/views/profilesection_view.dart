import 'package:apotech/app/core/theme/colors.dart';
import 'package:apotech/app/core/theme/typography.dart';
import 'package:apotech/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfilesectionView extends GetView {
  const ProfilesectionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 24,
        automaticallyImplyLeading: false,
        title: const Text('My Profile'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Material(
                  elevation: 2,
                  shape: const CircleBorder(),
                  clipBehavior: Clip.hardEdge,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const CircleAvatar(
                      radius: 31,
                      backgroundImage: AssetImage('assets/images/dummy_pp.jpg'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hi, Lorem Ipsum',
                      style: TextStyle(
                          color: purpleText,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text('Welcome to Apotech',
                        style: ApotechTypography.defafult)
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: ListTile(
                        dense: true,
                        onTap: () {},
                        minVerticalPadding: 0,
                        contentPadding: EdgeInsets.zero,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        leading: SvgPicture.asset(
                          controller.profileListTile[index]['image'],
                          width: 24,
                          height: 24,
                        ),
                        title: Text(
                          controller.profileListTile[index]['title'],
                          style: TextStyle(
                              color: const Color(0xFF091C3F).withOpacity(0.75),
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color: purpleText,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20.w,
                          ),
                          Expanded(
                              child: Divider(
                            color: purpleText.withOpacity(0.08),
                            thickness: 1,
                          ))
                        ],
                      ),
                    ),
                itemCount: controller.profileListTile.length),
          ),
        ],
      ),
    );
  }
}
