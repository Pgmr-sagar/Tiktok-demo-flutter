import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_demo/feed_with_stateful_cubit/data/model/feed_item.dart';
import 'package:tiktok_demo/feed_with_stateful_cubit/view/feed_content.dart';
import 'package:tiktok_demo/feed_with_cubit_only/tiktok_cubit.dart';
import 'package:tiktok_demo/feed_with_cubit_only/tiktok_state.dart';
import 'package:video_player/video_player.dart';

class TiktokFeed extends StatelessWidget {
  final FeedItem item;
  final PageController pageController;
  final int index;

  const TiktokFeed({
    super.key,
    required this.item,
    required this.pageController,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TikTokCubit(item.videoUrl),
      child: Builder(
        builder: (context) {
          final tikTokCubit = BlocProvider.of<TikTokCubit>(context);

          pageController.addListener(() {
            tikTokCubit.onScroll(pageController.page ?? 0, index);
          });

          return GestureDetector(
            onTap: () {
              if (tikTokCubit.state.controller.value.isPlaying) {
                tikTokCubit.pause();
              } else if (tikTokCubit.state.controller.value.isInitialized) {
                tikTokCubit.play();
              }
            },
            child: BlocBuilder<TikTokCubit, TiktokState>(
              builder: (context, state) {
                return AspectRatio(
                  aspectRatio: state.controller.value.aspectRatio,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      state.controller.value.isInitialized
                          ? VideoPlayer(state.controller)
                          : const CircularProgressIndicator(),
                      FeedContent(item: item),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
