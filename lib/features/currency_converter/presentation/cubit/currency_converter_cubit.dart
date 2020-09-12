import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:examples/features/currency_converter/domain/entities/currency.dart';
import 'package:examples/features/currency_converter/domain/usecases/currency_converter_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meta/meta.dart';
part 'currency_converter_state.dart';

class CurrencyConverterCubit extends Cubit<CurrencyConverterState> {
  CurrencyConverterCubit() : super(CurrencyConverterInitial());

  ICurrencyConverterUsecase usecase = Modular.get<ICurrencyConverterUsecase>();
  void getCurrencies() async {
    emit(CurrencyConverterLoading());
    final result = await usecase.getCurrencies();
    result.fold((failure) {
      emit(CurrencyConverterError(message: failure.message));
    }, (currency) {
      emit(CurrencyConverterDone(currency: currency));
    });
  }
}
