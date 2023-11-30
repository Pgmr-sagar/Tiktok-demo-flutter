import 'package:tiktok_demo/feed_with_stateful_cubit/data/model/feed_item.dart';

abstract class FeedState {
  const FeedState();
}

class FeedInitialState extends FeedState {}

class FeedLoadedState extends FeedState {
  final List<FeedItem> videos;

  FeedLoadedState({required this.videos});
}

class FeedErrorState extends FeedState {
  final String error;

  FeedErrorState({required this.error});
}
