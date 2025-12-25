import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leak_tracker/leak_tracker.dart';
import 'package:my_sivi_chat/core/extension/extension.dart';

import 'core/bloc_initiater/bloc_initiater.dart';
import 'core/errors/error_screen.dart';
import 'core/injection/injection_container.dart' as di;
import 'core/network/listener/network_listener.dart';
import 'core/routes/app_router.dart';
import 'core/utils/ui_utills.dart';
import 'core/utils/utility.dart';

final themeNotifier = ValueNotifier<ThemeMode>(ThemeMode.light);

Future<void> main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      // setting app to work only in portrait
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      di.appInitInjection();
      LeakTracking.start(
        config: LeakTrackingConfig(
          onLeaks: (leak) {
            debugPrint('Leak found: ${leak.toMessage()}');
          },
        ),
      );

      LeakTracking.stop();

      runApp(const MyApp());

      // Global Flutter UI error handler
      FlutterError.onError = (FlutterErrorDetails details) {
        Utility.showPrints(
          message:
              "❌ UI error caught in Flutter error =>  ${details.exception}\n ${details.stack}",
        );
      };
      ErrorWidget.builder = (FlutterErrorDetails details) =>
          const ErrorScreen();
    },
    (error, stackTrace) async {
      Utility.showPrints(
        message: "❌ Caught error in runZonedGuarded => $error\n$stackTrace",
      );
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, themeMode, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return ScreenUtilInit(
              designSize: ScreenUtil.defaultSize,
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return MultiBlocProvider(
                  providers: BlocInitiator.blocInitialization(),
                  child: NetworkListener(
                    child: Builder(
                      builder: (context) {
                        return MaterialApp.router(
                          scaffoldMessengerKey: messengerKey,
                          routerConfig: di.getIt<AppRouter>().router,
                          debugShowCheckedModeBanner: false,

                          builder: (context, child) {
                            final mediaQuery = MediaQuery.of(context);
                            final clamps = mediaQuery.textScaler.clamp(
                              minScaleFactor: 1.0,
                              maxScaleFactor: 1.4,
                            );
                            return MediaQuery(
                              data: mediaQuery.copyWith(textScaler: clamps),
                              child: child!,
                            ).customSystemNavigation();
                          },
                        );
                      },
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
