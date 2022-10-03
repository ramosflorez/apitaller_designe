import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apitaller/Models/Model_Pokemon.dart';

class PokemonProvider{


  Future<List<ModelPokemon>> getPokemon() async{

    final url1="https://pokeapi.co/api/v2/pokemon?limit=20&offset=0";
    final respuesta=await http.get(Uri.parse(url1) );
    if (respuesta.statusCode==200){
      String body=utf8.decode(respuesta.bodyBytes);
      final jsonData=jsonDecode(body);

      final pokemon=Pokemon();

      for (var item in jsonData['results']){
        final url2=item['url'];
        final features= await http.get(Uri.parse(url2));
        body= utf8.decode(features.bodyBytes);
        final jsonFeatures=jsonDecode(body);
        pokemon.setPokemons(jsonFeatures);
      }

      return pokemon.pokemones;
    }else{
      throw Exception("Ocurrio algo ${respuesta.statusCode}");
    }
  }
}