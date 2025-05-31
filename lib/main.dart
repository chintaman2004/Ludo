// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

void main() {
  runApp(LudoApp());
}

class LudoApp extends StatelessWidget {
  const LudoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LudoBoard(), debugShowCheckedModeBanner: false);
  }
}

class LudoBoard extends StatelessWidget {
  final int gridSize = 15;

  const LudoBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ludo Board")),
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: GridView.builder(
            itemCount: gridSize * gridSize,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: gridSize,
            ),
            itemBuilder: (context, index) {
              int row = index ~/ gridSize;
              int col = index % gridSize;

              Color color = Colors.white;

              if (row < 6 && col < 6) {
                color = Colors.red[300]!;
              } else if (row < 6 && col > 8)
                color = Colors.green[300]!;
              else if (row > 8 && col < 6)
                color = Colors.yellow[300]!;
              else if (row > 8 && col > 8)
                color = Colors.blue[300]!;
              else if (col == 7 || row == 7)
                color = Colors.grey[300]!;

              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 0.2),
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
