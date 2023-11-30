import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_demo/feed_with_stateful_cubit/cubit/feed_cubit.dart';
import 'package:tiktok_demo/feed_with_stateful_cubit/cubit/feed_state.dart';
import 'package:tiktok_demo/feed_with_cubit_only/tiktok_feed.dart';
import 'package:tiktok_demo/utility/di_helper.dart';

class VideoList extends StatelessWidget {
  final PageController _pageController = PageController();

  VideoList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: BlocProvider(
          create: (_) => FeedCubit(get())..fetchVideo(),
          child: BlocBuilder<FeedCubit, FeedState>(
            builder: (context, state) {
              if (state is FeedInitialState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is FeedLoadedState) {
                final videos = state.videos;

                return PageView.builder(
                  controller: _pageController,
                  scrollDirection: Axis.vertical,
                  itemCount: videos.length,
                  itemBuilder: (context, index) {
                    final video = videos[index];
                    return TiktokFeed(item: video, pageController: _pageController, index: index);

                    // return VideoCard(
                    //   key: UniqueKey(),
                    //   item: video,
                    //   pageController: _pageController,
                    //   index: index,
                    // );
                  },
                );
              } else if (state is FeedErrorState) {
                return Center(child: Text(state.error));
              } else {
                return const Center(child: Text("Unknown error"));
              }
            },
          ),
        ),
      ),
    );
  }
}
