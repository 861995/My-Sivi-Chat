import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:translator/translator.dart';

import '../state/translation_states.dart';

class TranslationCubit extends Cubit<TranslationState> {
  final GoogleTranslator _translator;

  TranslationCubit(this._translator) : super(const TranslationInitial());

  Future<void> translateLatinToEnglish(String text) async {
    try {
      emit(const TranslationLoading());

      final translation = await _translator.translate(
        text,
        from: 'la',
        to: 'en',
      );

      emit(TranslationSuccess(translation.text));
    } catch (e) {
      emit(const TranslationError('Translation failed'));
    }
  }

  void reset() {
    emit(const TranslationInitial());
  }
}
