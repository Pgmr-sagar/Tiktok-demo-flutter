import 'package:bloc/bloc.dart';
import 'package:tiktok_demo/feed_with_stateful_cubit/cubit/feed_state.dart';
import 'package:tiktok_demo/feed_with_stateful_cubit/data/repository/feed_repository.dart';

class FeedCubit extends Cubit<FeedState> {
  final FeedRepository repository;

  FeedCubit(this.repository) : super(FeedInitialState());

  void fetchVideo() async {
    emit(FeedInitialState());
    try {
      final videos = await repository.getFeedItems();
      emit(FeedLoadedState(videos: videos));
    } catch (e) {
      emit(FeedErrorState(error: e.toString()));
    }
  }
}
