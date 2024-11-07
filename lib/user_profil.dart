import 'package:flutter/foundation.dart';
import 'dart:io';

class UserProfile with ChangeNotifier {
  String _username = "";
  File? _image;

  String get username => _username;
  File? get image => _image;

  void setUsername(String username) {
    _username = username;
    notifyListeners(); // Menggunakan notifyListeners untuk memberitahu semua listener tentang perubahan
  }

  void setImage(File? image) {
    _image = image;
    notifyListeners(); // Memanggil notifyListeners ketika gambar diperbarui
  }
}
