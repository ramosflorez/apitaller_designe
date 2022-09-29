import 'dart:math';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import '../data.dart';



class MyHomeApp extends StatefulWidget{
  State<StatefulWidget> createState()=>_myHomePage_state();
}
class _myHomePage_state extends State<MyHomeApp> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("API"),

      ),
      body: Container(

        child: Column(
          children: [
            Container(
                width: double.infinity,
                height: 300,
                child: PageView(

                  controller: PageController(
                      viewportFraction: 0.7,
                      initialPage: 0

                  ),
                  children: <Widget>[
                    Pagina(Colors.green, "verde"),
                    Pagina(Colors.red, "rojo"),
                    Pagina(Colors.blue, "azul"),
                    Pagina(Colors.pink, "rosado"),


                  ],
                )
            ),
            Container(

              height: 250,
              child: Swiper(
                itemWidth: 300,
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                        image: AssetImage(images2[index]),
                        fit: BoxFit.cover,
                      ));
                },
                viewportFraction: 0.8,
                scale: 0.9,
                layout: SwiperLayout.STACK,

              ),
            )
          ],
        ),
      ),
    );
  }


}

class Pagina extends StatelessWidget{
  final color;
  final text;
   Pagina(this.color, this.text);


  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Container(
          padding: EdgeInsets.only(top:15), //apply padding to all four sides
          child: Text(
            this.text,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,

          ),
        ),


        Container(
          width: double.infinity,
          height: 200,
          margin: EdgeInsets.only(left: 10, top:20),
          decoration: BoxDecoration(
              color:this.color,
              borderRadius: BorderRadius.circular(30)

          ),
        )
      ],
    );
  }

}