import 'package:tiktok_demo/feed_with_stateful_cubit/data/model/feed_item.dart';
import 'package:tiktok_demo/feed_with_stateful_cubit/data/service/feed_service.dart';

class FeedRepository {
  final FeedService service;

  FeedRepository(this.service);

  Future<List<FeedItem>> getFeedItems() async {
    try {
      return service.fetchFeedItems();
    } catch (e) {
      // Handle or rethrow repository-specific errors
      throw ('Error in fetching videos: $e');
    }
  }
}
