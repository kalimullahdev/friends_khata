import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:friends_khata/core/presentation/router/router.gr.dart';

class KhataDetailsPage extends StatelessWidget {
  const KhataDetailsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Khata Details'),
        actions: [
          TextButton(
              onPressed: () => context.pushRoute(const TransactionRoute()),
              child: const Text(
                "Transc",
              )),
          TextButton(
              onPressed: () =>
                  context.pushRoute(const TransactionHistoryRoute()),
              child: Text(
                "TH",
              )),
        ],
      ),
      body: Center(
        child: Column(children: [
          ListTile(
            title: const Text("Abdullah"),
            trailing: Text(
              "Rs 300",
              style: TextStyle(
                  color: Colors
                      .green), // TODO: Change value of color based on condition
            ),
          ),
          ListTile(
            title: const Text("Safi"),
            trailing: Text(
              "Rs -200",
              style: TextStyle(color: Colors.red),
            ),
          ),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.arrow_upward),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red[600], // Background color
                ),
                onPressed: () {},
                label: const Text("Mana diya"),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.arrow_downward),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green[600], // Background color
                ),
                onPressed: () {},
                label: const Text("Mana liya"),
              ),
            ],
          )),
        ]),
      ),
    );
  }
}
