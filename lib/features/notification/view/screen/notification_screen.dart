// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:job_finder_app/core/widget/app_bar.dart';
import 'package:job_finder_app/core/widget/header.dart';
import 'package:job_finder_app/features/notification/model/notificationModel.dart';
import 'package:job_finder_app/features/notification/view/widget/notification_item.dart';
import 'package:sizer/sizer.dart';
import 'notification_empty_screen.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isEmpty = false;

    return Scaffold(
      appBar: customAppBar('Notification', context),
      body: !isEmpty
          ? SingleChildScrollView(
              child: Column(
              children: [
                const CustomHeader('New'),
                SizedBox(height: 1.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: notifications.length,
                    itemBuilder: (BuildContext context, int index) =>
                        NotificationItem(notifications[index]),
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(indent: 24.0, endIndent: 24.0),
                  ),
                ),
                const CustomHeader('Yesterday'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: yesterdayNotifications.length,
                    itemBuilder: (BuildContext context, int index) =>
                        NotificationItem(yesterdayNotifications[index]),
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(indent: 24.0, endIndent: 24.0),
                  ),
                ),
              ],
            ))
          : const NotificationEmptyScreen(),
    );
  }
}