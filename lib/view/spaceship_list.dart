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

class _SpaceShipListState extends State<SpaceShipList> {
  StarshipBussiness get service => GetIt.I<StarshipBussiness>();
  late APIResponse<List<Starship>> _starships;
  bool _isLoading = false;

  @override
  void initState() {
    _fetchSpaceShips();
    super.initState();
  }

  _fetchSpaceShips() async {
    setState(() {
      _isLoading = true;
    });

    _starships = await service.list();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SpaceShipsv2'),
      ),
      body: Builder(
        builder: (_) {
          if (_isLoading) {
            return CircularProgressIndicator();
          }
          if (_starships.error) {
            return Center(child: Text(_starships.errorMessage));
          }
          return ListView.separated(
              separatorBuilder: (_, __) =>
                  Divider(height: 0),
              itemCount: _starships.data.length,
              itemBuilder: (_, int index) {
                return Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Card(
                          margin: EdgeInsets.all(12.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(Icons.star),
                                  title: Text(
                                    _starships.data[index].name.toString(),
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    const SizedBox(
                                      width: 73,
                                      height: 50,
                                    ),
                                    Text(
                                      _starships.data[index].model.toString(),
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                      ]),
                );
              });
        },
      ),
    );
  }
}
