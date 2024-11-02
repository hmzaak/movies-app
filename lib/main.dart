import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/app/app.bottomsheets.dart';
import 'package:movies/app/app.dialogs.dart';
import 'package:movies/app/app.locator.dart';
import 'package:movies/app/app.router.dart';
import 'package:movies/app/app.snackbars.dart';
import 'package:movies/ui/common/app_theme.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  setupSnackbarUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        initialRoute: Routes.startupView,
        theme: AppTheme.appTheme,
        themeMode: ThemeMode.light,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        navigatorKey: StackedService.navigatorKey,
        debugShowCheckedModeBanner: false,
        navigatorObservers: [
          StackedService.routeObserver,
        ],
      ),
    );
  }
}
