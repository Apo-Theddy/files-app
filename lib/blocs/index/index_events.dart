import 'dart:io';

import 'package:files_app/models/file_model.dart';

abstract class IndexEvent {}

class IndexGetEvent extends IndexEvent {}

class AddFileEvent extends IndexEvent {
  File file;
  AddFileEvent(this.file);
}
