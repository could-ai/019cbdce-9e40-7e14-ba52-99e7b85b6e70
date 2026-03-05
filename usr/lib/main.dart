import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const SalesTeamApp());
}

class SalesTeamApp extends StatelessWidget {
  const SalesTeamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sales Team Names',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 2,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const TeamNameGeneratorScreen(),
      },
    );
  }
}

class TeamNameGeneratorScreen extends StatefulWidget {
  const TeamNameGeneratorScreen({super.key});

  @override
  State<TeamNameGeneratorScreen> createState() => _TeamNameGeneratorScreenState();
}

class _TeamNameGeneratorScreenState extends State<TeamNameGeneratorScreen> {
  // A comprehensive list of strong sales team names
  final List<String> _allNames = [
    'The Closers',
    'Revenue Rangers',
    'Quota Crushers',
    'Deal Makers',
    'Sales Sharks',
    'Profit Pilots',
    'Target Terminators',
    'Hustle Heroes',
    'Alpha Squad',
    'Market Masters',
    'Growth Guardians',
    'Pipeline Pioneers',
    'Victory Ventures',
    'Strategy Squad',
    'Business Barons',
    'The Rainmakers',
    'Conversion Kings',
    'Deal Hunters',
    'Success Soldiers',
    'Peak Performers',
    'Momentum Makers',
    'Visionary Vanguards',
    'Dynamic Drivers',
    'Elite Executives',
    'Prime Producers',
    'Global Giants',
    'Summit Seekers',
    'Impact Innovators',
    'Legacy Leaders',
    'Fortune Finders',
  ];

  String _featuredName = 'Tap to Generate';

  void _generateRandomName() {
    setState(() {
      _featuredName = _allNames[Random().nextInt(_allNames.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales Team Name Generator'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Column(
        children: [
          // Featured Random Name Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(32.0),
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            child: Column(
              children: [
                const Text(
                  'Your Team Name:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  _featuredName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: _generateRandomName,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Generate New Name'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // List of All Names
          Expanded(
            child: ListView.builder(
              itemCount: _allNames.length,
              itemBuilder: (context, index) {
                final name = _allNames[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  title: Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.copy_outlined),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('$name copied to clipboard!'),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
