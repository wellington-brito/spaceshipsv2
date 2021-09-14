import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spaceshipsv2/entity/api_response.dart';
import 'package:spaceshipsv2/entity/starship.dart';

class SpaceshipsService {
  static const api = "https://swapi.dev/api/starships";

  Future<APIResponse<List<Starship>>> getSpaceShips() {
    return http.get(Uri.parse(api)).then((response) {
      if (response.statusCode == 200) {
        final starships = <Starship>[];
        Map<String, dynamic> list = jsonDecode(response.body);
        for (var data in list["results"]) {
          Starship starship = new Starship(
              name: data['name'],
              model: data['model'],
              manufacturer: data['manufacturer'],
              costInCredits: data['cost_in_credits'],
              length: data['length'],
              maxAtmospheringSpeed: data['max_atmosphering_speed'],
              crew: data['crew'],
              passengers: data['passengers'],
              cargoCapacity: data['cargo_capacity'],
              consumables: data['consumables'],
              hyperdriveRating: data['hyperdrive_rating'],
              mglt: data['MGLT'],
              starshipClass: data['starship_class']);
          starships.add(starship);
        }
        return APIResponse<List<Starship>>(data: starships);
      } else {
        return APIResponse<List<Starship>>(
            data: [],
            error: true,
            errorMessage: 'An erro ocurred. Status code');
      }
    }).catchError((_) => APIResponse<List<Starship>>(
        data: [], error: true, errorMessage: 'An erro ocurred. Status code'));
  }
}
