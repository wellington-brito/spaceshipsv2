class Starship{
    String name;
    String model;
    String manufacturer;
    String costInCredits;
    String length;
    String maxAtmospheringSpeed;
    String crew;
    String passengers;
    String cargoCapacity;
    String consumables;
    String hyperdriveRating;
    String mglt;
    String starshipClass;

   Starship({
    required this.name,
    required this.model,
    required this.manufacturer,
    required this.costInCredits,
    required this.length,
    required this.maxAtmospheringSpeed,
    required this.crew,
    required this.passengers,
    required this.cargoCapacity,
    required this.consumables,
    required this.hyperdriveRating,
    required this.mglt,
    required this.starshipClass,
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