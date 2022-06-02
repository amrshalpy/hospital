import 'package:flutter/cupertino.dart';

class ArrowProvider with ChangeNotifier{
    Map<int, bool> isLiked = {};
  void changeIsLiked(int index) {
    isLiked[index] = !(isLiked[index] ?? false);
notifyListeners();
  }

}