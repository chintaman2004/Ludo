import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(home: LudoManualBoard(), debugShowCheckedModeBanner: false),
  );
}

class LudoManualBoard extends StatelessWidget {
  const LudoManualBoard({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manual Ludo Board')),
      body: Center(
        child: Container(
          width: 400, // 👈 board width
          height: 400, // 👈 board height
          color: Colors.black12,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(15, (row) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(15, (col) {
                  // Decide color for each box
                  Color boxColor = Colors.white;

                  // RED HOME AREA
                  if (row < 6 && col < 6)
                    boxColor = Colors.red[300]!;
                  // GREEN HOME AREA
                  else if (row < 6 && col > 8)
                    boxColor = Colors.green[300]!;
                  // YELLOW HOME AREA
                  else if (row > 8 && col < 6)
                    boxColor = Colors.yellow[300]!;
                  // BLUE HOME AREA
                  else if (row > 8 && col > 8)
                    boxColor = Colors.blue[300]!;
                  // CENTER PATH
                  else if (row == 7 || col == 7)
                    boxColor = Colors.grey[300]!;

                  return Container(
                    width: 24, // 👈 bigger box width
                    height: 24, // 👈 bigger box height
                    margin: EdgeInsets.all(0.5),
                    color: boxColor,
                  );
                }),
              );
            }),
          ),
        ),
      ),
    );
  }
}
