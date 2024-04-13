import 'dart:async';
import 'dart:html' as html;

class ImagePickerUseCase {
  Future<html.File?> call() async {
    final completer = Completer<html.File?>();
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.accept = 'image/*';
    uploadInput.click();
    uploadInput.onChange.listen((e) async {
      final files = uploadInput.files;

      if (files != null && files.isNotEmpty) {
        final selectedFile = files[0];
        completer.complete(selectedFile);
      } else {
        completer.complete(null);
      }
    });
    return completer.future;
  }
}
