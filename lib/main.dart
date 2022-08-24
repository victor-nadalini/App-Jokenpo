import 'package:flutter/material.dart';
import 'package:projeto_app_jokenpo/jogo.dart';

void main(){
  runApp(const MaterialApp(
    home: Jogo(),//jogo instancia da classe de Jogo
    debugShowCheckedModeBanner: false,
  ));
}