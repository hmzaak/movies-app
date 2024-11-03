import 'package:movies/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:movies/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:movies/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:movies/ui/views/root/root_view.dart';
import 'package:movies/ui/views/under_dev/under_dev_view.dart';
import 'package:movies/ui/views/watch/watch_view.dart';
import 'package:movies/ui/views/movie_details/movie_details_view.dart';
import 'package:movies/services/api_service.dart';
import 'package:movies/services/repository_service.dart';
// @stacked-import

@StackedApp(
  logger: StackedLogger(),
  routes: [
    MaterialRoute(page: StartupView),
    MaterialRoute(page: RootView),
    MaterialRoute(page: UnderDevView),
    MaterialRoute(page: WatchView),
    MaterialRoute(page: MovieDetailsView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: RepositoryService),
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
