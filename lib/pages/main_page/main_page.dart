import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kalkulator_potrosnje/database/kalkulator_potrosnje_db.dart';
import 'package:kalkulator_potrosnje/models/vehicle.dart';
import 'package:kalkulator_potrosnje/pages/main_page/components/car_box.dart';
import 'package:kalkulator_potrosnje/pages/main_page/components/fuel_prices_box.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool loadingList = true;
  List<Vehicle> vehicleList = [];

  Future<void> loadVehicleList() async {
    try {
      setState(() {
        loadingList = true;
      });
    } catch (e) {
      //pass
    }

    vehicleList = await KalkulatorPotrosnjeDB().getVehicles();
    try {
      setState(() {
        loadingList = false;
      });
    } catch (e) {
      //pass
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Timer(const Duration(seconds: 1), () async {
      await loadVehicleList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //KalkulatorPotrosnjeDB().addVehicle(Vehicle(id: 1, name: "Test", fuelType: 2, averageFuelConsumption: 2.5));
          //List<Vehicle> lista = await KalkulatorPotrosnjeDB().getVehicles();
          //await loadVehicleList();
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Row(
                children: [
                  FuelPricesBox(
                      "Eurosuper 95:", "1.54", "Eurosuper 100:", "2.01"),
                  FuelPricesBox(
                      "Eurodizel:", "1.46", "Premium eurodizel:", "1.93")
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: (loadingList)
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      )
                    : (vehicleList.isEmpty)
                        ? const Center(
                            child: Text(
                              "Nemate dodanih vozila! Za dodavanje vozila pritisnite +.",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          )
                        : ListView.builder(
                            itemCount: vehicleList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CarBox(
                                  vehicleType: 1,
                                  vehicleName: vehicleList[index].name,
                                  fuelType:
                                      vehicleList[index].fuelType.toString(),
                                  averageFuelConsumption: "8.3");
                            }),
              ),
              /* CarBox(
                vehicleType: 1,
                vehicleName: "Mazda 3",
                fuelType: 'Benzin',
                averageFuelConsumption: '8.4',
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
