import 'package:spaceshipsv2/entity/api_response.dart';
import 'package:spaceshipsv2/entity/starship.dart';
import 'package:spaceshipsv2/services/spaceships_service.dart';

class StarshipBussiness{
  
  listOne() async{
    SpaceshipsService service = new SpaceshipsService();
    return await service.getSpaceShips();
  }

  list() async{
    SpaceshipsService service = new SpaceshipsService();
    List<Starship> starships = await service.getSpaceShips();
    return starships;
  }


  adjustList(){}
 
}