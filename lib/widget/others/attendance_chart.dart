import 'package:flutter/material.dart';

class AttendanceChartWidget extends StatelessWidget {
  final List<double> data = [120, 100, 120, 100, 100];
  final List<String> labels = ['1/8', '2/8', '3/8', '4/8', '5/8'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AttendanceToday(),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {
                  return Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        (120 - (index * 20)).toString(),
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: data.map((value) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 40,
                          height: value,
                          color: Colors.lightBlueAccent.withOpacity(0.5),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          labels[data.indexOf(value)],
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AttendanceToday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Students Attendance Today',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                value: 24 / 30,
                strokeWidth: 10,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                backgroundColor: Colors.green.withOpacity(0.3),
              ),
            ),
            const Text(
              '24/30',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(home: Scaffold(body: AttendanceChartWidget())));
}
