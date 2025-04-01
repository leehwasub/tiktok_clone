import 'package:flutter/material.dart';

class VideoConfig extends ChangeNotifier {
  bool autoMute = false;

  void toogleAutoMute() {
    autoMute = !autoMute;
    notifyListeners();
  }
}

final videoConfig = VideoConfig();
