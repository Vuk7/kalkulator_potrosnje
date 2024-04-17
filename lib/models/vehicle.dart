class Vehicle {
  final int id;
  final String name;
  final int fuelType;
  final double averageFuelConsumption;

  Vehicle(
      {required this.id,
      required this.name,
      required this.fuelType,
      required this.averageFuelConsumption});

  Vehicle.fromDB(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        fuelType = map["fuelType"],
        averageFuelConsumption = map["averageFuelConsumption"];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'fuelType': fuelType,
      'averageFuelConsumption': averageFuelConsumption
    };
  }
}
