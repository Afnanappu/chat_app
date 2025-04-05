import 'package:file_picker/file_picker.dart';

class CustomFilePicker {
  /// Allows the user to pick an image file from their device, and returns the
  /// path to the selected file. If the user cancels, returns null.
  ///
  /// The type of file picker is determined by the platform. For example, on
  /// Android, this will show a file picker dialog with the apps that support
  /// image selection. On iOS, this will show the system file picker sheet.
  ///
  /// The file picker will only allow the user to select image files.
  static Future<String?> pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result == null) return null;
    return result.paths.first;
  }
}
