import 'package:api/api.dart';
import 'package:better_life_customer/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_theme/my_theme.dart';
import 'package:widgets/widgets.dart';

import '../../caretaker/views/new_appointments.dart';

class MyDrawer extends StatelessWidget {
  final bool caretaker;
  const MyDrawer({this.caretaker = false, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 323,
      child: Drawer(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    padding: kPadding,
                    height: 160.h,
                    child: Column(
                      children: [
                        Gap(70.h),
                        _buildHeader(context),
                      ],
                    ),
                  ),
                  Gap(20.h),
                  if (!caretaker)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          _customTile(
                            Icons.badge,
                            'History of Appointments',
                            isSelected: true,
                          ),
                        ],
                      ),
                    ),
                  if (caretaker)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          _customTile(
                            Icons.badge,
                            'New Appointments',
                            isSelected: true,
                            onTap: () {
                              Get.to<void>(const CTNewAppointment());
                            },
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: _customTile(
                Icons.logout,
                'Logout',
                onTap: () {
                  context.read<ApiRepo>().logout();
                  Get.offAll<void>(const LoginPage());
                },
              ),
            ),
            Gap(30.h),
          ],
        ),
      ),
    );
  }

  Row _buildHeader(BuildContext context) {
    return Row(
      children: [
        Gap(10.w),
        Expanded(
          child: StreamBuilder<User?>(
            stream: context.read<ApiRepo>().userStream,
            builder: (context, snapshot) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  snapshot.data?.fullName ?? 'User',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  snapshot.data?.email ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _divider() {
    return const Divider(
      color: Color.fromARGB(255, 252, 208, 233),
      height: 1,
    );
  }

  Widget _customTile(
    IconData icon,
    String title, {
    VoidCallback? onTap,
    bool isSelected = false,
  }) {
    return ListTile(
      dense: true,
      selected: isSelected,
      selectedColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: kBorderRadius),
      selectedTileColor: kPrimaryColor,
      onTap: () async {
        Get.back<void>();
        onTap?.call();
      },
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
