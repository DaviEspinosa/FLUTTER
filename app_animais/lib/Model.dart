class Animal {
  // atributos "?" para dizer que ele pode ser nulo
  String _especies;
  String _urlFoto;
  String _urlAudio;

  //construtor
  Animal(this._especies, this._urlFoto, this._urlAudio);

  //getters
  String get urlFoto => _urlFoto;
  String get especies => _especies;
  String get urlAudio => _urlAudio;

  //setters
  set especies(String especies) {
    this._especies = especies;
  }

  set urlFoto(String urlFoto) {
    this._urlFoto = urlFoto;
  }

  set urlAudio(String urlAudio) {
    this._urlAudio = urlAudio;
  }
}
