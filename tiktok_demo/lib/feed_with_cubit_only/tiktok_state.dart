import 'package:tiktok_demo/utility/string_extension.dart';
import 'package:video_player/video_player.dart';

class TiktokState {
  final VideoPlayerController controller;
  final bool loaded;
  final bool autoPlay;
  final bool isClosed;

  bool get notLoaded => !loaded;

  TiktokState._({
    required this.controller,
    required this.loaded,
    required this.autoPlay,
    required this.isClosed,
  });

  factory TiktokState.initialize({
    required String url,
    bool autoPlay = true,
    bool isClosed = false,
  }) {
    final controller = VideoPlayerController.networkUrl(
      url.getUri(),
    );
    return TiktokState._(
      controller: controller,
      loaded: false,
      autoPlay: autoPlay,
      isClosed: isClosed,
    );
  }

  TiktokState copyWith({
    VideoPlayerController? controller,
    bool? loaded,
    bool? autoPlay,
    bool? isClosed,
  }) {
    return TiktokState._(
      controller: controller ?? this.controller,
      loaded: loaded ?? this.loaded,
      autoPlay: autoPlay ?? this.autoPlay,
      isClosed: isClosed ?? this.isClosed,
    );
  }

  Future<void> play() async {
    await controller.play();
  }

  Future<void> pause() async {
    await controller.pause();
  }

  Future<void> initialize() async {
    await controller.initialize();
  }

  Future<void> dispose() async {
    await controller.dispose();
  }
}
