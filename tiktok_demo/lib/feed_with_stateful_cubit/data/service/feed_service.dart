import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_demo/feed_with_stateful_cubit/data/model/feed_item.dart';
import 'package:tiktok_demo/network/api_service.dart';
import 'package:tiktok_demo/network/api_url.dart';
import 'package:tiktok_demo/network/network_request.dart';

class FeedService {
  final ApiService apiService;

  FeedService(this.apiService);

  Future<List<FeedItem>> fetchFeedItems() async {
    try {
      final response = await apiService.request(
        apiUrl: ApiUrl.completeUrl,
        method: RequestMethod.get,
      );

      return convertToList(response);
    } catch (e, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      throw Exception(e);
    }
  }

  List<FeedItem> convertToList(Response<dynamic> response) {
    final list = response.data["data"] as List;
    final videoList = list
        .map(
          (videoJson) => FeedItem.fromMap(videoJson),
        )
        .toList();

    return videoList;
  }
}
