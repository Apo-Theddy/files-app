import 'package:files_app/models/dir_model.dart';

abstract class FolderEvent {}

class ReadFilesByFolderEvent extends FolderEvent {
  int dirID;
  int numPage;
  ReadFilesByFolderEvent(this.dirID, this.numPage);
}

class AddFolderEvent extends FolderEvent {
  Dir dir;
  AddFolderEvent(this.dir);
}
