import 'dart:convert';
import 'dart:io';

import 'package:files_app/models/file_model.dart';
import 'package:files_app/models/index_model.dart';
import 'package:http/http.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import "package:mime/mime.dart" as mime;
import 'package:http_parser/http_parser.dart';

const endpoint = "http://192.168.1.2:3000";

class IndexRepository {
  Future<IndexModel> getIndex() async {
    Response response = await get(Uri.parse("$endpoint/index"));
    if (response.statusCode == 200) {
      final Map<String, dynamic> result = jsonDecode(response.body);
      return IndexModel.fromJson(result);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<FileModel> uploadFile(File file) async {
    var stream = ByteStream(DelegatingStream.typed(file.openRead()));
    var length = await file.length();
    final mimetype = mime.lookupMimeType(file.path)!;
    var request = MultipartRequest("POST", Uri.parse("$endpoint/files/upload"));
    var multipartFile = MultipartFile("file", stream, length,
        filename: basename(file.path), contentType: MediaType.parse(mimetype));
    request.files.add(multipartFile);
    var response = await request.send();
    if (response.statusCode == 201) {
      var value = await response.stream.transform(utf8.decoder).join();
      return FileModel.fromJson(json.decode(value));
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<List<FileModel>> filesByDir(int dirID, int numPage) async {
    Response response =
        await get(Uri.parse("$endpoint/files/dirs/$dirID?page=$numPage"));
    if (response.statusCode == 200) {
      List result = jsonDecode(response.body);
      return result.map((file) => FileModel.fromJson(file)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
