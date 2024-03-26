import 'package:flutter/material.dart';
import 'package:mystery_dinning_adventure/core/resources/notification_wrapper.dart';
import 'package:mystery_dinning_adventure/presentation/notifier/notifier.dart';
import 'package:provider/provider.dart';

extension CxtExtension on BuildContext {
  // theme related
  ThemeData get theme => Theme.of(this);
  AppBarTheme get appbarTheme => AppBarTheme.of(this);
  DialogTheme get dialogTheme => DialogTheme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  TabBarTheme get tabbarTheme => Theme.of(this).tabBarTheme;

  // size related
  Size get size => MediaQuery.of(this).size;
  EdgeInsets get padding => MediaQuery.of(this).padding;

  // navigator related
  NavigatorState get nav => Navigator.of(this);

  // media queries
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  // focus scope
  FocusScopeNode get focusScope => FocusScope.of(this);

  NotificationWrapperStackState get notify => NotificationWrapperStack.of(this);

  MyNotifier get myn => read<MyNotifier>();
}
