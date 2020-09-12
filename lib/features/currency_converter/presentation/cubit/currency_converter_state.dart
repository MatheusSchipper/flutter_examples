part of 'currency_converter_cubit.dart';

abstract class CurrencyConverterState extends Equatable {
  const CurrencyConverterState();

  @override
  List<Object> get props => [];
}

class CurrencyConverterInitial extends CurrencyConverterState {}

class CurrencyConverterLoading extends CurrencyConverterState {}

class CurrencyConverterDone extends CurrencyConverterState {
  final Currency currency;

  CurrencyConverterDone({@required this.currency});
}

class CurrencyConverterError extends CurrencyConverterState {
  final String message;

  CurrencyConverterError({@required this.message});
}
