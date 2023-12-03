import 'package:files_app/models/dir_model.dart';

class FileModel {
  int fileID;
  String originalName;
  String uniqueName;
  String path;
  String typeExtension;
  int? width;
  int? height;
  double size;
  String? creationDate;
  String? deleteDate;
  Dir? dir;

  FileModel({
    required this.fileID,
    required this.originalName,
    required this.uniqueName,
    required this.path,
    required this.typeExtension,
    this.width,
    this.height,
    required this.size,
    this.creationDate,
    this.deleteDate,
    this.dir,
  });

  factory FileModel.fromJson(Map<String, dynamic> json) {
    return FileModel(
      fileID: json['FileID'],
      originalName: json['OriginalName'],
      uniqueName: json['UniqueName'],
      path: json['Path'],
      typeExtension: json["TypeExtension"],
      width: json["Width"],
      height: json["Height"],
      size: json["Size"],
      creationDate: json['CreationDate'],
      deleteDate: json['DeleteDate'],
      dir: json['Dir'] != null ? Dir.fromJson(json['Dir']) : null,
    );
  }
}
