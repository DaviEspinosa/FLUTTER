import 'package:app_animais/Model.dart';

class AnimalController {
  //atributo
  List<Animal> _listaAnimal = [];

  //getter da lista
  List get listarAnimal => _listaAnimal;

  void adicionarAnimal(especies, urlFoto, urlAudio) {
    Animal novoAnimal = Animal(especies, urlFoto, urlAudio);
    _listaAnimal.add(novoAnimal);
  }
}
