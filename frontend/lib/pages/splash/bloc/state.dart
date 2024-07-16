part of 'bloc.dart';

@immutable
abstract class State extends Equatable {
  final Model model;
  const State(this.model);

  @override
  List<Object> get props => [model];
}

class InitialState extends State {
  const InitialState(Model model) : super(model);
}

class FinalLoadState extends State {
  const FinalLoadState(Model model) : super(model);
}

class Model extends Equatable {
  final String? anyString;

  const Model({
    this.anyString,
  });

  Model copyWith({
    String? anyString,
  }) =>
      Model(
        anyString: anyString ?? this.anyString,
      );

  @override
  List<Object?> get props => [
        anyString,
      ];
}
