import 'package:files_app/blocs/folder/folder_events.dart';
import 'package:files_app/blocs/folder/folder_states.dart';
import 'package:files_app/models/file_model.dart';
import 'package:files_app/repos/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FolderBloc extends Bloc<FolderEvent, FolderState> {
  IndexRepository _repository;

  FolderBloc(this._repository) : super(FolderLoadingState()) {
    on<ReadFilesByFolderEvent>(_getFilesByDir);
  }

  _getFilesByDir(ReadFilesByFolderEvent event, Emitter emit) async {
    emit(FolderLoadingState());
    try {
      List<FileModel> files =
          await _repository.filesByDir(event.dirID, event.numPage);
      emit(FolderLoadedState(files));
    } catch (err) {
      emit(FolderErrorState(err.toString()));
    }
  }
}
