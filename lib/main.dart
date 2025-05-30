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

  const LudoBoard({super.key}); // 15x15 Ludo board

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simple Ludo Board")),
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: AspectRatio(
          aspectRatio: 1, // make sure it's a square
          child: GridView.builder(
            itemCount: gridSize * gridSize,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: gridSize,
            ),
            itemBuilder: (context, index) {
              int row = index ~/ gridSize;
              int col = index % gridSize;

              Color color = Colors.white;

              // Red Home (Top-Left)
              if (row < 6 && col < 6)
                color = Colors.red[300]!;
              // Green Home (Top-Right)
              else if (row < 6 && col > 8)
                color = Colors.green[300]!;
              // Yellow Home (Bottom-Left)
              else if (row > 8 && col < 6)
                color = Colors.yellow[300]!;
              // Blue Home (Bottom-Right)
              else if (row > 8 && col > 8)
                color = Colors.blue[300]!;
              // Middle Path
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
