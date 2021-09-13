import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:spaceshipsv2/entity/api_response.dart';
import 'package:spaceshipsv2/entity/starship.dart';
import 'package:spaceshipsv2/business/starship_business.dart';

class SpaceShipList extends StatefulWidget {
  @override
  _SpaceShipListState createState() => _SpaceShipListState();  
}

class _SpaceShipListState extends State<SpaceShipList>{

  StarshipBussiness get service => GetIt.I<StarshipBussiness>();
  bool _isLoading = false;
  late List<Starship> _starships;

  @override
  void initState(){
    _fetchSpaceShips();
    super.initState();
  }

  _fetchSpaceShips() async {
    setState((){
      _isLoading = true;
    });

    _starships = await service.list() ;
    print(_starships);

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Builder(
        builder: (_){
          if (_isLoading) {
              return CircularProgressIndicator();
            }
            // if (_starships.error) {
            //   return Center(child: Text(_starships.errorMessage));
            // }
              return ListView.separated(
                separatorBuilder: (_, __) =>
                    Divider(height: 1, color: Colors.blue),
                itemBuilder: (_, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.blue,
                      // backgroundImage: NetworkImage(""),
                    ),
                    title: Text(
                     "_starships.data[index].name",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    subtitle: Text(
                     "_starships.data[index].model",
                    ),
                    //onTap: () => Alert(message:  _apiResponse.data[index].blurb, shortDuration: false).show()
                  );
                },
                itemCount: _starships.length,
              );
        },
      ),
    );
  }


}