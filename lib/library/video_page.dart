import 'package:flutter/material.dart';
import 'package:gp_app_dev/library/firebase_file.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  final FirebaseFile file;
  const VideoPage({
    Key? key,
    required this.file,
  }) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  bool _isVideoInitialized = false;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.file.url))
          ..initialize().then((_) {
            setState(() {
              _isVideoInitialized = true;
            });
          });
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.file.name),
        centerTitle: true,
      ),
      body: Center(
        child: _isVideoInitialized
            ? Chewie(
                controller: _chewieController,
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
