// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:video_player/video_player.dart';

import 'package:tiktok_demo/feed_with_stateful_cubit/data/model/feed_item.dart';
import 'package:tiktok_demo/feed_with_stateful_cubit/view/feed_content.dart';
import 'package:tiktok_demo/utility/string_extension.dart';

class VideoCard extends StatefulWidget {
  final FeedItem item;
  final PageController pageController;
  final int index;

  const VideoCard({
    super.key,
    required this.item,
    required this.pageController,
    required this.index,
  });

  @override
  _VideoCardState createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  VideoPlayerController? _controller;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    debugPrint('Creating VideoPlayerController for ${widget.item.caption}');
    _controller =
        VideoPlayerController.networkUrl(widget.item.videoUrl.getUri())
          ..initialize().then((value) {
            setState(() {
              _controller!.play();
            });
          });

    // intializePlayer(widget.video.videoUrl);

    _currentIndex = widget.index;
    widget.pageController.addListener(_onScroll);
    _controller?.setLooping(true);
  }

  @override
  void dispose() {
    debugPrint('Disposing VideoPlayerController for ${widget.item.caption}');
    if (_controller != null) {
      _controller!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_controller!.value.isPlaying) {
          _controller!.pause();
        } else if (_controller!.value.isInitialized) {
          _controller!.play();
        }
      },
      child: (_controller != null)
          ? AspectRatio(
              aspectRatio: _controller!.value.aspectRatio,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  _controller!.value.isInitialized
                      ? VideoPlayer(_controller!)
                      : const CircularProgressIndicator(),
                  FeedContent(item: widget.item)
                ],
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  void _onScroll() {
    final newPosition = widget.pageController.page;
    final isVideoVisible = newPosition?.round() == _currentIndex;

    if (isVideoVisible) {
      if (_controller != null) {
        if (_controller!.value.isInitialized) {
          _controller!.play();
        }
      }
    } else {
      if (_controller != null) {
        _controller!.pause();
      }
    }
  }

  Future<FileInfo?> checkCachedFor(String url) async {
    final FileInfo? value = await DefaultCacheManager().getFileFromCache(url);
    return value;
  }

  void cachedForUrl(String url) async {
    await DefaultCacheManager().getSingleFile(url).then((value) {
      debugPrint("Downloaded successfully done for $url");
    });
  }
}

class FeedAction extends StatelessWidget {
  const FeedAction({
    super.key,
    required this.title,
    this.icon = Icons.favorite,
    this.onTap,
  });

  final String title;
  final IconData icon;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    const double iconSize = 36;
    const double fontSize = 16;

    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Column(
        children: [
          Icon(
            icon,
            size: iconSize,
            color: Colors.white,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: fontSize,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}


    // if (isVideoVisible) {
    //   if (_controller == null) {
    //     // If the controller is null, initialize a new one
    //     debugPrint(
    //         'Creating VideoPlayerController for ${widget.video.caption}');
    //     intializePlayer(widget.video.videoUrl);
    //   }

    //   // Check if the controller is not null before playing
    //   if (_controller != null && !_controller!.value.isPlaying) {
    //     _controller!.play();
    //   }
    // } else {
    //   // Check if the controller is not null before pausing
    //   if (_controller != null && _controller!.value.isPlaying) {
    //     _controller!.pause();
    //   }
    // }

  // void intializePlayer(String url) async {
  //   final fileInfo = await checkCachedFor(url);

  //   if (fileInfo == null) {
  //     _controller =
  //         VideoPlayerController.networkUrl(widget.video.videoUrl.getUri())
  //           ..initialize().then((_) {
  //             cachedForUrl(url);

  //             setState(() {
  //               _controller!.play();
  //             });
  //           });
  //   } else {
  //     final file = fileInfo.file;

  //     _controller = VideoPlayerController.file(file)
  //       ..initialize().then((_) {
  //         setState(() {
  //           _controller!.play();
  //         });
  //       });
  //   }
  // }