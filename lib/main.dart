import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mystery_dinning_adventure/core/extension/context.dart';
import 'package:mystery_dinning_adventure/core/service_locator/injection_container.dart';
import 'package:mystery_dinning_adventure/core/theme/theme.dart';
import 'package:mystery_dinning_adventure/domain/repositories/repo.dart';
import 'package:mystery_dinning_adventure/presentation/notifier/notifier.dart';
import 'package:provider/provider.dart';

import 'core/app_core.dart';
import 'core/resources/notification_wrapper.dart';
import 'core/routes/route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  // Initialize the database at app start up
  await sl<MyRepo>().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      builder: (context, child) => MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: sl<MyNotifier>()),
          // more providers can be registered here
        ],
        child: MaterialApp.router(
          title: Strings.title,
          routerConfig: routerConfig,
          debugShowCheckedModeBanner: false,
          theme: theme(context),
          builder: (context, child) {
            // set up font scaling
            final scale = context.mediaQuery.textScaler.clamp(
              minScaleFactor: 0.9,
              maxScaleFactor: 1.0,
            );
            final MediaQueryData mediaQuery = context.mediaQuery.copyWith(
              textScaler: scale,
            );

            return MediaQuery(
              data: mediaQuery,
              child: NotificationWrapperStack(child: child!),
            );
          },
        ),
      ),
    );
  }
}
