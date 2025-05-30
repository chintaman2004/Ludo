import 'package:flutter/material.dart';

void main() {
  runApp(LudoApp());
}

class LudoApp extends StatelessWidget {
  const LudoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ludo Game',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LudoBoard(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LudoBoard extends StatelessWidget {
  final int gridSize = 15;

  const LudoBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ludo Board")),
      body: Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: GridView.builder(
            itemCount: gridSize * gridSize,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: gridSize,
            ),
            itemBuilder: (context, index) {
              final row = index ~/ gridSize;
              final col = index % gridSize;

              Color color = Colors.white;
              if (row < 6 && col < 6) {
                color = Colors.red[200]!; // Red zone
              } else if (row < 6 && col > 8)
                // ignore: curly_braces_in_flow_control_structures
                color = Colors.green[200]!; // Green zone
              else if (row > 8 && col < 6)
                // ignore: curly_braces_in_flow_control_structures
                color = Colors.yellow[200]!; // Yellow zone
              else if (row > 8 && col > 8)
                // ignore: curly_braces_in_flow_control_structures
                color = Colors.blue[200]!; // Blue zone

              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 0.3),
                  color: color,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
