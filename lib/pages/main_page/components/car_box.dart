import 'package:flutter/material.dart';

class CarBox extends StatelessWidget {
  final int vehicleType; // 1 - auto, 2 - motor, 3 - kamion
  final String vehicleName, fuelType, averageFuelConsumption;
  const CarBox(
      {super.key,
      required this.vehicleType,
      required this.vehicleName,
      required this.fuelType,
      required this.averageFuelConsumption});

  @override
  Widget build(BuildContext context) {
    IconData icon = Icons.car_repair;
    if (vehicleType == 2) {
      icon = Icons.motorcycle;
    } else if (vehicleType == 3) {
      icon = Icons.fire_truck;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Spacer(),
                  Text(
                    vehicleName,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                ],
              ),
              Row(
                children: [
                  Icon(
                    icon,
                    size: 50,
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.local_gas_station,
                    size: 30,
                  ),
                  Text(
                    fuelType,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  const Spacer(),
                  const Icon(
                    Icons.gas_meter_outlined,
                    size: 30,
                  ),
                  Text(
                    "Prosječno: $averageFuelConsumption L/100 km",
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
