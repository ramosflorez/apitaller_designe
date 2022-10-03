
class Pokemon{
  List<ModelPokemon> pokemones=[];

  Pokemon();
  setPokemons(Map<String, dynamic> json){
    if(json == null) return {};
    final pokemon = ModelPokemon.fromJsonMap(json);
    pokemones.add(pokemon);

  }
}

class ModelPokemon{
  late String Name;
  late String url;
  ModelPokemon(this.Name, this.url);

  ModelPokemon.fromJsonMap(Map <String, dynamic> json){
    Name=json["name"];
    url=json["sprites"]["other"]["official-artwork"]["front_default"];
  }
}