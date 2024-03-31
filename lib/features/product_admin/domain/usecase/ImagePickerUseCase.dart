import 'dart:html' as html;

class ImagePickerUseCase {
  Future<html.File?> call() async {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.click();
    await uploadInput.onChange.first;
    final files = uploadInput.files;

    return files?.isNotEmpty == true ? files![0] : null;
  }
}
