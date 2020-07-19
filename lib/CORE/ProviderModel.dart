import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UIModel extends ChangeNotifier {
  ///HomeScreen Logo Animation
  bool isLogoHovering = false;

  setIsLogoHovering(bool da) {
    isLogoHovering = da;
    notifyListeners();
  }

  ///Hover Effect Cursor
  Offset pointerPosition = Offset(600,400);

  setPointerPosition(Offset da) {
    pointerPosition = da;
    notifyListeners();
  }
}
