
import 'package:flutter/material.dart';
import '../widgets/drawer_navigation.dart';

class WdwScreen extends StatelessWidget {
  const WdwScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('World Ducati Week 2026'),
        backgroundColor: Colors.red[900],
      ),
      drawer: const DrawerNavigation(),
      body: Container(
        color: Colors.black,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/wdw.jpg'),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'All for One. The biggest Ducati party is back!',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    'From 3 to 6 July 2026, the Misano World Circuit Marco Simoncelli and the entire Adriatic Riviera will once again be lit up with the passion of thousands of Ducatisti. It will be a unique opportunity to experience the world of Ducati and meet your heroes.',
                    style: TextStyle(color: Colors.white70, fontSize: 16.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
