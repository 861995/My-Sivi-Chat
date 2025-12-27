abstract class TranslationState {
  const TranslationState();
}

class TranslationInitial extends TranslationState {
  const TranslationInitial();
}

class TranslationLoading extends TranslationState {
  const TranslationLoading();
}

class TranslationSuccess extends TranslationState {
  final String translatedText;

  const TranslationSuccess(this.translatedText);
}

class TranslationError extends TranslationState {
  final String message;

  const TranslationError(this.message);
}
