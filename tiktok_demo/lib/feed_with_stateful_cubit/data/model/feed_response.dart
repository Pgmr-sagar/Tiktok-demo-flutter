import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:tiktok_demo/feed_with_stateful_cubit/data/model/feed_item.dart';

class FeedResponse {
  final List<FeedItem> data;

  FeedResponse({
    required this.data,
  });

  FeedResponse copyWith({
    List<FeedItem>? data,
  }) {
    return FeedResponse(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  factory FeedResponse.fromMap(Map<String, dynamic> map) {
    return FeedResponse(
      data: List<FeedItem>.from(
        (map['data'] as List<int>).map<FeedItem>(
          (x) => FeedItem.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory FeedResponse.fromJson(String source) =>
      FeedResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FeedResponse(data: $data)';

  @override
  bool operator ==(covariant FeedResponse other) {
    if (identical(this, other)) return true;

    return listEquals(other.data, data);
  }

  @override
  int get hashCode => data.hashCode;
}
