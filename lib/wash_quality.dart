import 'package:carwash_automation/homepage.dart';
import 'package:carwash_automation/login.dart';
import 'package:flutter/material.dart';

import 'Booking.dart';
import 'categries.dart';
import 'package.dart';

class washquality extends StatefulWidget {
  const washquality({super.key});

  @override
  State<washquality> createState() => _washqualityState();
}

class _washqualityState extends State<washquality> {
  final Wallet wallet = Wallet(100.0); // Preloaded wallet balance
  final List<WashQuality> washQualities = [
    WashQuality('Basic', {
      'Small': 10.0,
      'Medium': 15.0,
      'Large': 20.0,
    }),
    WashQuality('Premium', {
      'Small': 20.0,
      'Medium': 25.0,
      'Large': 30.0,
    }),
    WashQuality('Deluxe', {
      'Small': 30.0,
      'Medium': 35.0,
      'Large': 40.0,
    }),
  ];

  void handleTransaction(double amount) {
    String message;
    if (wallet.deductAmount(amount)) {
      message = 'Transaction successful! New balance: \$${wallet.balance}';
    } else {
      message = 'Insufficient balance!';
    }
    showTransactionDialog(context, message);
    setState(() {});
  }

  void showTransactionDialog(BuildContext context, String message) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Transaction Status"),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pricing And Payment'),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Wallet Balance: \$${wallet.balance}',
                    style: TextStyle(fontSize: 20)),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text('Quality')),
                      DataColumn(label: Text('Small')),
                      DataColumn(label: Text('Medium')),
                      DataColumn(label: Text('Large')),
                      DataColumn(label: Text('Action')),
                    ],
                    rows: washQualities.map((quality) {
                      return DataRow(cells: [
                        DataCell(Text(quality.quality)),
                        DataCell(Text('\$${quality.prices['Small']}')),
                        DataCell(Text('\$${quality.prices['Medium']}')),
                        DataCell(Text('\$${quality.prices['Large']}')),
                        DataCell(
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () =>
                                    handleTransaction(quality.prices['Small']!),
                                child: Text('Buy Small'),
                              ),
                              SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () =>
                                    handleTransaction(quality.prices['Medium']!),
                                child: Text('Buy Medium'),
                              ),
                              SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () =>
                                    handleTransaction(quality.prices['Large']!),
                                child: Text('Buy Large'),
                              ),
                            ],
                          ),
                        ),
                      ]);
                    }).toList(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 400),
                child: ElevatedButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> booking(),));

                }, child:Text('For Booking')),
              )
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> homepage(),));
                },
              ),
              ListTile(
                leading: const Icon(Icons.category),
                title: const Text('All Category'),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> homepage(),));
                },
              ),
              ListTile(
                leading: const Icon(Icons.category),
                title: const Text(' Add Category '),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> categries(),));
                },
              ),
              ListTile(
                leading: const Icon(Icons.add),
                title: const Text(' All Package '),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> homepage(),));
                },
              ),
              ListTile(
                leading: const Icon(Icons.add),
                title: const Text(' Add Package'),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> package(),));
                },
              ),
              ListTile(
                leading: const Icon(Icons.request_page),
                title: const Text(' Service Request '),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> booking(),));
                },
              ),
              ListTile(
                leading: const Icon(Icons.price_change),
                title: const Text('Pricing & Payment'),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> washquality(),));
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('LogOut'),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> login(),));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WashQuality {
  final String quality;
  final Map<String, double> prices;

  WashQuality(this.quality, this.prices);
}

class Wallet {
  double balance;

  Wallet(this.balance);

  bool deductAmount(double amount) {
    if (balance >= amount) {
      balance -= amount;
      return true;
    }
    return false;
  }

  void addAmount(double amount) {
    balance += amount;
  }
}
