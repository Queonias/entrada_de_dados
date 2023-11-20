import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // _controller = VideoPlayerController.networkUrl(Uri.parse(
    //     "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4"))
    //   ..initialize().then((_) {
    //     setState(() {
    //       _controller.play();
    //     });
    //   });
    _controller = VideoPlayerController.asset("videos/exemplo.mp4")
      ..setLooping(true)
      ..initialize().then((_) {
        setState(() {
          // _controller.play();
        });
      });
  }

  // https://youtu.be/YD_tx3mpI24

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : const Text("Pressione Play")),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: _controller.value.isPlaying
              ? const Icon(Icons.play_arrow)
              : const Icon(Icons.pause)),
    );
  }
}
