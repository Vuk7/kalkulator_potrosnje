import 'package:flutter/material.dart';
import 'package:kalkulator_potrosnje/pages/main_page/components/car_box.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              CarBox(
                vehicleType: 1,
                vehicleName: "Mazda 3",
                fuelType: 'Benzin',
                averageFuelConsumption: '8.4',
              ),
              CarBox(
                vehicleType: 1,
                vehicleName: "Audi A3",
                fuelType: 'Dizel',
                averageFuelConsumption: '6.3',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
