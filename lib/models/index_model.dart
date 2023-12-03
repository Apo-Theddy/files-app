import 'package:files_app/models/dir_model.dart';
import 'package:files_app/models/file_model.dart';
import 'package:files_app/models/storage_model.dart';

class IndexModel {
  IndexModel(
    this.recentFiles,
    this.files,
    this.dirs,
    /*this.storage*/
  );
  List<FileModel> recentFiles;
  List<FileModel> files;
  List<Dir> dirs;
  // StorageModel storage;

  factory IndexModel.fromJson(Map<String, dynamic> json) {
    List<FileModel> files = (json["Files"] as List<dynamic>)
        .map((file) => FileModel.fromJson(file))
        .toList();
    List<FileModel> recentFiles = (json["RecentFiles"] as List<dynamic>)
        .map((file) => FileModel.fromJson(file))
        .toList();
    List<Dir> dirs = (json["Dirs"] as List<dynamic>)
        .map((dir) => Dir.fromJson(dir))
        .toList();

    return IndexModel(
      recentFiles,
      files,
      dirs, /*StorageModel.fromJson(json["Storage"])*/
    );
  }
  IndexModel copyWith({
    List<FileModel>? recentFiles,
    List<FileModel>? files,
    List<Dir>? dirs,
    FileModel? newFile,
  }) {
    final newFiles =
        newFile != null ? [...this.files, newFile] : files ?? this.files;
    return IndexModel(
      recentFiles ?? this.recentFiles,
      newFiles,
      dirs ?? this.dirs,
    );
  }
}
