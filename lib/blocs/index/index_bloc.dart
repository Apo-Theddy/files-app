import 'package:files_app/blocs/index/index_events.dart';
import 'package:files_app/blocs/index/index_states.dart';
import 'package:files_app/models/file_model.dart';
import 'package:files_app/models/index_model.dart';
import 'package:files_app/repos/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IndexBloc extends Bloc<IndexEvent, IndexState> {
  final IndexRepository _repository;
  late IndexModel _indexModel;

  IndexBloc(this._repository) : super(IndexLoadingState()) {
    on<IndexGetEvent>(_getEvent);
    on<AddFileEvent>(_addEvent);
  }

  void _getEvent(IndexEvent event, Emitter emit) async {
    emit(IndexLoadingState());
    try {
      IndexModel index = await _repository.getIndex();
      _indexModel = index;
      emit(IndexLoadedState(index));
    } catch (err) {
      emit(IndexErrorState(err.toString()));
    }
  }

  void _addEvent(AddFileEvent event, Emitter emit) async {
    try {
      await _repository.uploadFile(event.file);
      IndexModel index = await _repository.getIndex();
      emit(IndexLoadedState(index));
    } catch (err) {
      emit(IndexErrorState(err.toString()));
    }
  }
}
