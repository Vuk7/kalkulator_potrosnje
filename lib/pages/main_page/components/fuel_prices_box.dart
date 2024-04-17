import 'package:flutter/material.dart';

class FuelPricesBox extends StatelessWidget {
  final String firstName, firstPrice, secondName, secondPrice;
  const FuelPricesBox(
      this.firstName, this.firstPrice, this.secondName, this.secondPrice,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 5,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(
                    firstName,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Text(
                    "$firstPrice EUR",
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    secondName,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Text(
                    "$secondPrice EUR",
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
