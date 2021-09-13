class Starship{
    String name ='';
    String model='';
    String manufacturer='';
    String costInCredits='';
    String length='';
    String maxAtmospheringSpeed='';
    String crew='';
    String passengers='';
    String cargoCapacity='';
    String consumables='';
    String hyperdriveRating='';
    String mglt='';
    String starshipClass='';
   
   Starship({required String name,
    required String model,
    required String manufacturer,
    required String costInCredits,
    required String length,
    required String maxAtmospheringSpeed,
    required String crew,
    required String passengers,
    required String cargoCapacity,
    required String consumables,
    required String hyperdriveRating,
    required String mglt,
    required String starshipClass,
   });

   factory Starship.fromJson(Map<String, dynamic> json) {
    return Starship(
      name: json['name'],
      model: json['model'],
      manufacturer: json['manufacturer'],
      costInCredits: json['costInCredits'],
      length: json['length'],
      maxAtmospheringSpeed: json['maxAtmospheringSpeed'],
      crew: json['crew'],
      passengers: json['passengers'],
      cargoCapacity: json['cargoCapacity'],
      consumables: json['consumables'],
      hyperdriveRating: json['hyperdriveRating'],
      mglt: json['MGLT'],
      starshipClass: json['starshipClass']
    );
  }
}