import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_demo/feed_with_cubit_only/tiktok_state.dart';

class TikTokCubit extends Cubit<TiktokState> {

  bool _isClosed = false;

  TikTokCubit(String url, {bool autoPlay = true})
      : super(TiktokState.initialize(
          url: url,
          autoPlay: autoPlay,
        )) {
    initializeController();
  }

  void initializeController() async {
    await state.initialize();
    emit(state.copyWith(
      loaded: true,
    ));
    if (state.autoPlay) {
      play();
    }
  }

  void play() {
    if (!_isClosed) {
      state.controller.play();
      emit(state);
    }
  }

  void pause() {
    if (!_isClosed) {
      state.controller.pause();
      emit(state);
    }
  }

  void onScroll(double newPosition, int currentIndex) {
    if (!_isClosed) {
      final isVideoVisible = newPosition.round() == currentIndex;

      if (isVideoVisible) {
        play();
      } else {
        pause();
      }
    }
  }

  @override
  Future<void> close() async {
    if (!_isClosed) {
      _isClosed = true;
      await state.dispose();
      super.close();
    }
  }
}
