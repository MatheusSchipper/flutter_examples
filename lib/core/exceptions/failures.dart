import 'package:equatable/equatable.dart';

abstract class IFailure extends Equatable {
  final String message;

  IFailure({this.message});
}

class InvalidInputFailure extends IFailure {
  InvalidInputFailure({String message}) : super(message: message);

  @override
  List<Object> get props => [];
}
