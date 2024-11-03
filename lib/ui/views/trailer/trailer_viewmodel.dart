import 'package:flutter/services.dart';
import 'package:movies/app/app.locator.dart';
import 'package:stacked/stacked.dart';

import 'package:stacked_services/stacked_services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  late YoutubePlayerController youtubePlayerController;

  void init(String videoId) async {
    setBusy(true);
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        enableCaption: false,
      ),
    );
    setBusy(false);
  }

  void onExitVideoPlayer() async {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    _navigationService.back();
  }

  @override
  void dispose() {
    youtubePlayerController.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }
}
