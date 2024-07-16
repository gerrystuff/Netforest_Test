import 'package:bloc/bloc.dart' as bloc;
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/repository.dart';

part 'event.dart';
part 'state.dart';

class Bloc extends bloc.Bloc<Event, State> {
  Repository? repository;
  Bloc([this.repository]) : super(initialState) {
    repository ??= Repository();
    on<LoadInitialEvent>(_loadInitialEvent);
  }
  static State get initialState => const InitialState(
        Model(),
      );
  void _loadInitialEvent(LoadInitialEvent event, Emitter<State> emit) async {
    emit(InitialState(state.model));


    await Future.delayed(const Duration(seconds: 2));

    emit(FinalLoadState(state.model));
  }

}
