import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mystery_dinning_adventure/core/extension/context.dart';

enum NotificationType { info, error, success, warning }

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    required this.message,
    super.key,
    this.type = NotificationType.success,
    this.onTap,
    this.action,
    this.title,
  });

  final String message;
  final NotificationType type;
  final VoidCallback? onTap;
  final String? action;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return SlideInLeft(
      child: Dismissible(
        key: Key(message),
        direction: DismissDirection.endToStart,
        onDismissed: (_) {
          context.notify.removeNotification();
        },
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                constraints: BoxConstraints(
                  minHeight: 60.h,
                ),
                margin: EdgeInsets.only(
                  top: context.padding.top * 1.2,
                  left: 8.w,
                  right: 8.w,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2.w,
                    color: notificationType(type),
                  ),
                  color: notificationBackground(type),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        constraints: BoxConstraints(minHeight: 60.h),
                        color: notificationType(type),
                        alignment: Alignment.center,
                        child: Icon(
                          notificationIcon(type),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    8.horizontalSpace,
                    Expanded(
                      flex: 6,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          6.verticalSpace,
                          Text(
                            title ?? notificationTitle(type),
                            style: context.textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: notificationType(type),
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: message,
                                  style: context.textTheme.bodySmall!.copyWith(
                                    fontSize: 14.sp,
                                    color: notificationType(type),
                                  ),
                                ),
                                if (onTap != null) ...[
                                  TextSpan(
                                    text: ' ',
                                    style: context.textTheme.bodySmall,
                                  ),
                                  TextSpan(
                                    text: action ?? 'Click here',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = onTap,
                                    style:
                                        context.textTheme.bodySmall!.copyWith(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                      color: notificationType(type),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => context.notify.removeNotification(),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Color notificationType(NotificationType type) {
  return switch (type) {
    NotificationType.error => const Color(0xFFC32121),
    NotificationType.info => const Color(0xFF62ACED),
    NotificationType.success => const Color(0xFF1EB871),
    NotificationType.warning => const Color(0xFFCFA012),
  };
}

Color notificationBackground(NotificationType type) {
  return switch (type) {
    NotificationType.error => const Color(0xFFFFEEEE),
    NotificationType.info => const Color(0xFFEDF5FB),
    NotificationType.success => const Color(0xFFEFFCF6),
    NotificationType.warning => const Color(0xFFFFFAEB),
  };
}

String notificationTitle(NotificationType type) {
  return switch (type) {
    NotificationType.error => 'Error',
    NotificationType.info => 'Info',
    NotificationType.success => 'Success',
    NotificationType.warning => 'Warning',
  };
}

IconData notificationIcon(NotificationType type) {
  return switch (type) {
    NotificationType.error => Icons.error,
    NotificationType.info => Icons.info,
    NotificationType.success => Icons.check_circle,
    NotificationType.warning => Icons.warning,
  };
}
