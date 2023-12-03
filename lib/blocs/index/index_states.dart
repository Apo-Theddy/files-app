import "package:equatable/equatable.dart";
import "package:files_app/models/file_model.dart";
import "package:files_app/models/index_model.dart";
import "package:flutter/cupertino.dart";

@immutable
abstract class IndexState extends Equatable {}

class IndexLoadingState extends IndexState {
  @override
  List<Object?> get props => [];
}

class IndexLoadedState extends IndexState {
  IndexModel index;
  IndexLoadedState(this.index);

  @override
  List<Object?> get props => [index];
}

class IndexErrorState extends IndexState {
  String error;
  IndexErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
