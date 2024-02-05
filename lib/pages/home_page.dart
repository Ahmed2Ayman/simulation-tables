import 'package:flutter/material.dart';
import '../service/create_excel.dart';

int? usersNumber;

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              TextField(
                decoration: const InputDecoration(
                  hintText: 'enter number of customers',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onSubmitted: (val) {
                  usersNumber = int.parse(val);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  createExcel();
                  // setFilePath();
                },
                child: const Text('Create Excel'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
