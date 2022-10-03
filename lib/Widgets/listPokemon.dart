import 'package:flutter/material.dart';
import 'package:apitaller/Models/Model_Pokemon.dart';
import '../Models/Model_Pokemon.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:google_fonts/google_fonts.dart';


List <Widget>listPokemon(List<ModelPokemon> data){
  List<Widget> Pokemones=[];

  for (var pokemon in data){
    Pokemones.add(Card(
        color: const Color.fromARGB(255, 221, 221, 221),
      child: Column(
        children: [
          Text(pokemon.Name, style: GoogleFonts.bungeeInline(),),
          Expanded(child: Image.network(pokemon.url, fit: BoxFit.fill)),


        ],
      ),
    ));

  }

  return Pokemones;
}

Widget ContentSwiper(List<ModelPokemon> data){

  return Container(
    width: double.maxFinite,
    height: 320.0,
    child: Swiper(
        itemWidth: 200.0,
        itemCount: data.length,
        layout: SwiperLayout.STACK,
        viewportFraction: 0.8,
        scale: 0.9,

        itemBuilder: (BuildContext context, int index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),

            // padding: const EdgeInsets.all(2.0),
            color: const Color.fromARGB(255, 221, 221, 221),
            child: Image.network(data[index].url),
            // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),),


          );
        }
    ),
  );
}

