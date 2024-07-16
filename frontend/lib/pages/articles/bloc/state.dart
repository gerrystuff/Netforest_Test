part of 'bloc.dart';

@immutable
abstract class State extends Equatable {
  final Model model;
  const State(this.model);

  @override
  List<Object> get props => [model];
}

class InitialState extends State {
  const InitialState(super.model);
}




class FailuredState extends State {
  const FailuredState(super.model);
}


class LoadingState extends State {
  const LoadingState(super.model);
}

class LoadedState extends State {
  const LoadedState(super.model);
}


class Model extends Equatable {
  
  final List<Article>? articles;
  final String? errorMessage;
  const Model({
    this.articles,
    this.errorMessage,
  });

  Model copyWith({
    List<Article>? articles,
    String? errorMessage,
  }) =>
      Model(
        articles: articles ?? this.articles,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object?> get props => [
        articles,
        errorMessage,
      ];
}
