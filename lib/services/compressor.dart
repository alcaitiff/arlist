import 'dart:convert';
import 'package:archive/archive.dart';

class Compressor {
  String compress(String content) {
    var stringBytes = utf8.encode(content);
    var gzipBytes = GZipEncoder().encode(stringBytes);
    var compressedString = base64.encode(gzipBytes);
    return compressedString;
  }

  String decompress(String compressedString) {
    var gzipBytes = base64.decode(compressedString);
    var stringBytes = GZipDecoder().decodeBytes(gzipBytes);
    var content = utf8.decode(stringBytes);
    return content;
  }
}
