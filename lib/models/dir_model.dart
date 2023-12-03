import 'package:files_app/models/file_model.dart';

class Dir {
  int dirID;
  String dirName;
  String? creationDate;
  String? deleteDate;

  Dir(
      {required this.dirID,
      required this.dirName,
      this.creationDate,
      this.deleteDate});

  factory Dir.fromJson(Map<String, dynamic> json) {
    return Dir(
        dirID: json['DirID'],
        dirName: json['DirName'],
        creationDate: json['CreationDate'],
        deleteDate: json['DeleteDate']);
  }
}
