import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class AudioController extends ChangeNotifier {

  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  double totalDuration = 0;


  AudioController() {
    assetsAudioPlayer.open(
      Audio("assets/audio/Deva Deva.mp3",
      metas: Metas(
        image: MetasImage(path: "assets/images/Deva Deva.jpg", type: ImageType.asset),
        

      ),
      ),

      autoStart: false,
      showNotification: true,

    ).then((value) {

      totalDuration = assetsAudioPlayer.current.value!.audio.duration.inSeconds.toDouble();

    });
  }

  play(){
    assetsAudioPlayer.play();
    notifyListeners();
  }

  pause(){
    assetsAudioPlayer.pause();
    notifyListeners();
  }


  seek({required int seconds}){

    Duration(
      seconds: seconds
    );
    notifyListeners();
  }



}