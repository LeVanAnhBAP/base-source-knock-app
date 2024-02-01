
import 'dart:typed_data';
import 'package:http/http.dart' as http;
class ImageProcessing{
  static Future<Uint8List> getBytesFromUrl(String url) async {
    final response = await http.get(Uri.parse(url));
    return Uint8List.fromList(response.bodyBytes);
  }
}