import 'package:bloc/bloc.dart' as bloc;
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/repository.dart';
part 'state.dart';
part 'event.dart';

class Bloc extends bloc.Bloc<Event, State> {
  Repository? repository;
  Bloc([this.repository]) : super(initialState) {
    repository ??= Repository();
    on<LoadInitialEvent>(_loadInitialEvent);
  }
  static State get initialState => const InitialState(
        Model(),
      );
  void _loadInitialEvent(LoadInitialEvent event, Emitter<State> emit) {
    emit(
      InitialState(state.model),
    );
  }
}
