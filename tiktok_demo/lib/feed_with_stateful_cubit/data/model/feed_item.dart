import 'dart:convert';

class FeedItem {
  final String contentId;
  final String caption;
  final String thumbnail;
  final String videoUrl;
  final dynamic views;
  final dynamic likes;
  final DateTime createdAt;

  FeedItem({
    required this.contentId,
    required this.caption,
    required this.thumbnail,
    required this.videoUrl,
    required this.views,
    required this.likes,
    required this.createdAt,
  });

  FeedItem copyWith({
    String? contentId,
    String? caption,
    String? thumbnail,
    String? videoUrl,
    dynamic views,
    dynamic likes,
    DateTime? createdAt,
  }) {
    return FeedItem(
      contentId: contentId ?? this.contentId,
      caption: caption ?? this.caption,
      thumbnail: thumbnail ?? this.thumbnail,
      videoUrl: videoUrl ?? this.videoUrl,
      views: views ?? this.views,
      likes: likes ?? this.likes,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'contentId': contentId,
      'caption': caption,
      'thumbnail': thumbnail,
      'url': videoUrl,
      'views': views,
      'likes': likes,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory FeedItem.fromMap(Map<String, dynamic> map) {
    return FeedItem(
      contentId: map['contentId'] as String,
      caption: map['caption'] as String,
      thumbnail: map['thumbnail'] as String,
      videoUrl: map['url'] as String,
      views: map['views'] as dynamic,
      likes: map['likes'] as dynamic,
      createdAt: DateTime.parse(map['createdAt'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory FeedItem.fromJson(String source) =>
      FeedItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FeedItem(contentId: $contentId, caption: $caption, thumbnail: $thumbnail, url: $videoUrl, views: $views, likes: $likes, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant FeedItem other) {
    if (identical(this, other)) return true;

    return other.contentId == contentId &&
        other.caption == caption &&
        other.thumbnail == thumbnail &&
        other.videoUrl == videoUrl &&
        other.views == views &&
        other.likes == likes &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return contentId.hashCode ^
        caption.hashCode ^
        thumbnail.hashCode ^
        videoUrl.hashCode ^
        views.hashCode ^
        likes.hashCode ^
        createdAt.hashCode;
  }
}
