import 'package:app/pages/articles/models/article.dart';
import 'package:bloc/bloc.dart' as bloc;
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  void _loadInitialEvent(LoadInitialEvent event, Emitter<State> emit) async {


    try {
      emit(LoadingState(state.model));


      final response = await repository!.loadArticles();
      
      emit(LoadedState(state.model.copyWith(
        articles: response,
      )));

    } catch (e) {
      if (e is DioException) {
        emit(FailuredState(state.model.copyWith(
          errorMessage: e.response?.data['message'] ?? 'Error desconocido',
        )));
      }

      emit(FailuredState(state.model.copyWith(
        errorMessage: 'Error desconocido',
      )));
    }
  }
}
