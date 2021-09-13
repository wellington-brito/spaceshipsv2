import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spaceshipsv2/entity/api_response.dart';
import 'package:spaceshipsv2/entity/starship.dart';

class SpaceshipsService {
  static const api = "https://swapi.dev/api/starships";
  
  /* Future<APIResponse<List<Starship>>> getSpaceShips() {
   
    return http
        .get( Uri.parse(api))
        .then((response) {
      if (response.statusCode == 200) {

         final starships = <Starship>[];

         Map<String, dynamic> starshipsMap = jsonDecode(response.body);

          for (var item in starshipsMap['results']['value']) {          

            Map<String, dynamic> ssMap = starshipsMap['results'][item];
            
            print(ssMap['name']);
            
            Starship starship = new Starship(
              name: ssMap['name'],
              model: ssMap['model'],
              manufacturer: ssMap['manufacturer'],
              costInCredits: ssMap['cost_in_credits'],
              length: ssMap['length'],
              maxAtmospheringSpeed: ssMap['max_atmosphering_speed'],
              crew: ssMap['crew'],
              passengers: ssMap['passengers'],
              cargoCapacity: ssMap['cargo_capacity'],
              consumables: ssMap['consumables'],
              hyperdriveRating: ssMap['hyperdrive_rating'],
              mglt: ssMap['MGLT'],
              starshipClass: ssMap['starship_class']
            );
            starships.add(starship);
        }
        return APIResponse<List<Starship>>(data: starships);
      } else {
        return APIResponse<List<Starship>>(
            data: [], error: true, errorMessage: 'An erro ocurred. Status code');
      }
    });
  }
 */
  
  Future<List<Starship>> getSpaceShips() async {
    final response =http
        .get( Uri.parse(api))
        .then((response) {return response;});

    return (Starship as List)
        .map<Starship>((json) => Starship.fromJson(json))
        .toList();
  }


}