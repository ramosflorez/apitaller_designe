import 'package:apitaller/Models/Model_Pokemon.dart';
import 'package:flutter/material.dart';
import 'package:apitaller/Widgets/listPokemon.dart';
import 'package:apitaller/Pokemon_Provider/Pokemon_Provider.dart';
import 'package:google_fonts/google_fonts.dart';



class MyHomeApp extends StatefulWidget{
  final String title;
  const MyHomeApp({Key? key, required this.title}): super(key: key);

  State<StatefulWidget> createState()=>_myHomePage_state();
}
class _myHomePage_state extends State<MyHomeApp> {

  late Future<List<ModelPokemon>> ListaPokemon;

  @override
  void initState() {
    super.initState();

    final getProvider = PokemonProvider();
    ListaPokemon = getProvider.getPokemon();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),

      ),
      body: FutureBuilder(
        future: ListaPokemon,
        builder: (context, Snapshot) {
          if (Snapshot.hasData) {
            return Column(
              children: <Widget>[
                Container(
                  height: 200,
                  padding: const EdgeInsets.all(15),
                  child: PageView(
                      controller: PageController(
                          viewportFraction: 0.7,
                          initialPage: 0

                      ),

                    children: listPokemon(Snapshot.data as List<ModelPokemon>),
                  ),
                ),
                Container(
                  height: 300,
                  padding: const EdgeInsets.all(15),
                  child: ContentSwiper(Snapshot.data as List<ModelPokemon>),
                )
              ],
            );
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },

      ),
    );
  }
}



