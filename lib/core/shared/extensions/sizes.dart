import 'package:flutter/material.dart';

//!chamamos essa classe na primeira tela que existe no app (aqui seria a splashPage)

class Sizes {
  Sizes._(); //construtor privado, ao chama-lo sera assim Sizes.atributo_da_classe

  double _width = 0;
  double _height = 0;

  static const Size _designSize = Size(414.0, 896.0);

  //construtor singleton
  static final Sizes _instance = Sizes._();
  factory Sizes() => _instance;

  //get -> fica publico
  double get width => _width;
  double get height => _height;

  //método de configuração inicial
  static void init(BuildContext context, {Size designSize = _designSize,}) {
    //maybeOf -> verifica se existe dados de mediaQUery
    final deviceData = MediaQuery.maybeOf(context);

    //caso nao exista mediaQuery
    final deviceSize = deviceData?.size ?? _designSize;

    //atualiza getters
    _instance._height = deviceSize.height;
    _instance._width = deviceSize.width;
  }
}

extension SizeExt on num {
  //Calcula o valor proporcional baseado na largura do dispositivo em relação ao prototipo
  double get w {
    //this -> valor atuao do objeto
    //multiplica e depois divide
    return (this * Sizes._instance._width) / Sizes._designSize.width;
  }

  //Calcula o valor proporcional baseado na altura do dispositivo em relação ao prototipo
  double get h {
    //this -> valor atuao do objeto
    //multiplica e depois divide
    return (this * Sizes._instance._height) / Sizes._designSize.height;
  }
}
