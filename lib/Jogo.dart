// ignore_for_file: file_names, prefer_const_constructors, prefer_final_fields, unused_field
// ignore_for_file: avoid_print
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'dart:math'; 

class Jogo extends StatefulWidget {
  const Jogo({ Key? key }) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("assets/img/padrao.png");
  var _mensagem = "Escolha uma opção abaixo"; 

  void _opcaoSelecionada(String Escolhausuario){

    var opcoes = ["pedra", "papel", "tesoura"]; 
    var numeros = Random().nextInt(3); 
    var escolhaApp = opcoes[numeros]; 

    print("escolha do app " + escolhaApp);
    print("escolha do usuario " + Escolhausuario);

    //exibição da imagem escolhida pelo app
    switch( escolhaApp ){
      case  "pedra":
      setState(() {
        this._imagemApp = AssetImage("assets/img/pedra.png");
        });
      break; 
      case  "papel":
      setState(() {
        this._imagemApp = AssetImage("assets/img/papel.png");
      });
      break; 
      case  "tesoura":
      setState(() {
        this._imagemApp = AssetImage("assets/img/tesoura.png");
      });
      break; 
    }
    //validação do ganhador:
    //usuario ganhou:
    if(
      (Escolhausuario == "pedra" && escolhaApp == "tesoura") ||
      (Escolhausuario == "tesoura" && escolhaApp == "papel") ||
      (Escolhausuario == "papel" && escolhaApp == "pedra")
      ){
        setState(() {
          this._mensagem = "Parabens voce ganhou!!! :)"; 
        });
        //app ganhou:
    }else if (
      (Escolhausuario == "pedra" && escolhaApp == "papel") ||
      (Escolhausuario == "tesoura" && escolhaApp == "pedra") ||
      (Escolhausuario == "papel" && escolhaApp == "tesoura")
    ){
      setState(() {
          this._mensagem = "Voce perdeu!!! :("; 
        });
      //empate:
    }else {
      setState(() {
          this._mensagem = "Empatamos kkkkk"; 
        });
    }
  }
  @override
  Widget build(BuildContext context) {//bild responsavel por construir a interface
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,// lida com os elementos da tela
        children: <Widget>[
        //1. text
        //2. imagem 
        //3. text resultado 
        //4. linha 3 imagens
        Padding(padding: EdgeInsets.only(top: 32, bottom: 16),// espaçamento maior encima e menor em baixo
        child: Text(
          "Escolha do App:", 
          textAlign: TextAlign.center,
          style: TextStyle(
          fontSize: 20, 
          fontWeight: FontWeight.bold
        ),
      ),
    ),
        Image(image: this._imagemApp,),
        Padding(padding: EdgeInsets.only(top: 32, bottom: 16),// espaçamento maior encima e menor em baixo
        child: Text(
          this._mensagem, 
          textAlign: TextAlign.center,
          style: TextStyle(
          fontSize: 20, 
          fontWeight: FontWeight.bold
        ),
      ),
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,// lida com o alinhamento
      children: <Widget>[
        GestureDetector(
          onTap: () => _opcaoSelecionada("pedra"),
          child: Image.asset("assets/img/pedra.png", height: 100,),
        ),
        GestureDetector(
          onTap: () => _opcaoSelecionada("papel"),
          child: Image.asset("assets/img/papel.png", height: 100,),
        ),
        GestureDetector(
          onTap: () => _opcaoSelecionada("tesoura"),
          child: Image.asset("assets/img/tesoura.png", height: 100,),
        )
        /*
        Image.asset("assets/img/papel.png", height: 100,),
        Image.asset("assets/img/pedra.png", height: 100,),
        Image.asset("assets/img/tesoura.png", height: 100,)
*/
      ],
    )
  ],
),
    );
  }
} 