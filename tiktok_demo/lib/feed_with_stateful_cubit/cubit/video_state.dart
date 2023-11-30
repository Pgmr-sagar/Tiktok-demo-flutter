import 'package:equatable/equatable.dart';
import 'package:video_player/video_player.dart';

abstract class VideoState {}

class VideoPlay extends VideoState {}
class VideoPause extends VideoState {}
class VideoInitial extends VideoState {}

// Events
abstract class VideoCardEvent extends Equatable {
  const VideoCardEvent();

  @override
  List<Object> get props => [];
}

class InitializeVideo extends VideoCardEvent {
  final String videoUrl;

  const InitializeVideo(this.videoUrl);

  @override
  List<Object> get props => [videoUrl];
}

class PlayVideo extends VideoCardEvent {}

class PauseVideo extends VideoCardEvent {}

// States
abstract class VideoCardState extends Equatable {
  const VideoCardState();

  @override
  List<Object> get props => [];
}

class VideoCardInitialized extends VideoCardState {
  final VideoPlayerController controller;

  const VideoCardInitialized(this.controller);

  @override
  List<Object> get props => [controller];
}

class VideoCardPlaying extends VideoCardState {}

class VideoCardPaused extends VideoCardState {}

class UpdatePage extends VideoCardEvent {
  final int currentPage;

  const UpdatePage(this.currentPage);

  @override
  List<Object> get props => [currentPage];
}
