import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Notification {
  final String message;

  Notification(this.message);
}

class NotificationWrapperStack extends StatefulWidget {
  final Widget child;

  const NotificationWrapperStack({
    required this.child,
    super.key,
  });

  static NotificationWrapperStackState of(BuildContext context) {
    return context.findAncestorStateOfType<NotificationWrapperStackState>()!;
  }

  @override
  NotificationWrapperStackState createState() => NotificationWrapperStackState();
}

class NotificationWrapperStackState extends State<NotificationWrapperStack>
    with WidgetsBindingObserver {
  late List<Widget> _notificationStack;
  bool shouldBlur = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _notificationStack = [];
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      shouldBlur = state == AppLifecycleState.inactive ||
          state == AppLifecycleState.paused;
    });
  }

  void addNotification(Widget notification, {int? howLong}) async {
    HapticFeedback.vibrate();

    setState(() {
      _notificationStack.add(notification);
    });

    Future.delayed(Duration(seconds: howLong ?? 7), removeNotification);
  }

  void removeNotification() {
    setState(() {
      if (_notificationStack.isNotEmpty) {
        _notificationStack.removeAt(_notificationStack.length - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      widget.child,
      ..._notificationStack,
      if (shouldBlur) ...{
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey.shade200.withOpacity(0.5),
          ),
        )
      },
    ]);
  }
}
