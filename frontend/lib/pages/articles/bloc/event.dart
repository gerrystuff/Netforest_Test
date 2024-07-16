part of 'bloc.dart';

abstract class Event extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadInitialEvent extends Event {
  LoadInitialEvent();
}


class AuthSelectedEvent extends Event {
  final String authSelected;
  AuthSelectedEvent(this.authSelected);
}




class AddPasswordEvent extends Event {
  final String password;
  AddPasswordEvent(this.password);
}

class AddEmailEvent extends Event {
  final String email;
  AddEmailEvent(this.email);
}


class LogInEvent extends Event {
  final String email;
  final String password;
  LogInEvent(this.email, this.password);
}

class ShowAndHidePasswordEvent extends Event {
  final bool show;
  ShowAndHidePasswordEvent(this.show);
}
