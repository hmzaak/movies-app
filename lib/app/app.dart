import 'package:movies/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:movies/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:movies/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:movies/ui/views/root/root_view.dart';
import 'package:movies/ui/views/under_dev/under_dev_view.dart';
// @stacked-import

@StackedApp(
  logger: StackedLogger(),
  routes: [
    MaterialRoute(page: StartupView),
    MaterialRoute(page: RootView),
    MaterialRoute(page: UnderDevView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
