class PalavrasCrudFormState {
  final String palavra;
  final bool aPalavraEhValida;
  final String ajuda;
  final bool aAjudaEhValida;
  final bool formularioEnviadoComSucesso;
  bool get isFormValid => aPalavraEhValida && aAjudaEhValida;

  const PalavrasCrudFormState(
      {this.palavra,
      this.aAjudaEhValida,
      this.ajuda,
      this.aPalavraEhValida,
      this.formularioEnviadoComSucesso});

  factory PalavrasCrudFormState.initial() {
    return PalavrasCrudFormState(
      palavra: '',
      aPalavraEhValida: false,
      ajuda: '',
      aAjudaEhValida: false,
      formularioEnviadoComSucesso: false
    );
  }

  PalavrasCrudFormState copyWith({
    String palavra,
    bool aPalavraEhValida,
    String ajuda,
    bool aAjudaEhValida,
    bool formlarioEnviadoComSucesso
  }) {
    return PalavrasCrudFormState(
      palavra: palavra ?? this.palavra,
      aPalavraEhValida: aPalavraEhValida ?? this.aPalavraEhValida,
      ajuda: ajuda ?? this.ajuda,
      aAjudaEhValida: aAjudaEhValida ?? this.aAjudaEhValida,
      formularioEnviadoComSucesso: formularioEnviadoComSucesso ?? this.formularioEnviadoComSucesso
    );
  }
}
