import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:spaceshipsv2/business/starship_business.dart';
import 'package:spaceshipsv2/services/spaceships_service.dart';
import 'package:spaceshipsv2/view/spaceship_list.dart';

final GetIt getIt = GetIt.I;

void main() {
  setUpLocator();
  runApp(MyApp());
}

void setUpLocator(){
 getIt.registerLazySingleton(() => SpaceshipsService());
 getIt.registerLazySingleton(() => StarshipBussiness());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SaceShipsV2',
      home: SpaceShipList(),
    );    
  }
}


