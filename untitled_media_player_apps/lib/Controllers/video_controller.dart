import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoController extends ChangeNotifier {

  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;


  List videos = [

    "video1.mp4",
    "video2.mp4",
  ];


  VideoController(){

    videoPlayerController = VideoPlayerController.asset("assets/video/${videos[0]}",
    videoPlayerOptions: VideoPlayerOptions(),

    )..initialize().then((value) {
      chewieController = ChewieController(
          videoPlayerController: videoPlayerController!,
      aspectRatio: videoPlayerController!.value.aspectRatio,
        autoPlay: false,
      );
      notifyListeners();

    });

  }


  ChangeVideo({required int index}){

    videoPlayerController!.pause();
    videoPlayerController = VideoPlayerController.asset("assets/video/${videos[0]}",
    )..initialize().then((value) {

      chewieController = ChewieController(
          videoPlayerController: videoPlayerController!,
      aspectRatio: videoPlayerController!.value.aspectRatio,
        autoPlay: false,
      );
      notifyListeners();
    });

  }

  play(){
    videoPlayerController!.play();
    notifyListeners();
  }

  pause(){
    videoPlayerController!.pause();
    notifyListeners();
  }


}