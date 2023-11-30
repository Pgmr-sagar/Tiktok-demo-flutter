import 'package:flutter/material.dart';
import 'package:tiktok_demo/feed_with_stateful_cubit/data/model/feed_item.dart';
import 'package:tiktok_demo/feed_with_stateful_cubit/view/video_card.dart';

class FeedContent extends StatelessWidget {
  const FeedContent({
    super.key,
    required this.item,
  });

  final FeedItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FeedAction(
                    title: item.views.toString(),
                  ),
                  const SizedBox(height: 16),
                  FeedAction(
                    title: item.likes.toString(),
                    icon: Icons.chat,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Text(
                  item.caption,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(0),
                child: const Icon(
                  Icons.circle_rounded,
                  size: 40,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
