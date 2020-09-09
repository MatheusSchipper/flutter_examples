import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'currency_converter_state.dart';

class CurrencyConverterCubit extends Cubit<CurrencyConverterState> {
  CurrencyConverterCubit() : super(CurrencyConverterInitial());
}
