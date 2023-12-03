import 'package:equatable/equatable.dart';
import 'package:files_app/models/file_model.dart';

abstract class FolderState extends Equatable {}

class FolderLoadingState extends FolderState {
  @override
  List<Object?> get props => [];
}

class FolderLoadedState extends FolderState {
  List<FileModel> files;

  FolderLoadedState(this.files);
  @override
  List<Object?> get props => [files];
}

class FolderErrorState extends FolderState {
  String error;
  FolderErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
