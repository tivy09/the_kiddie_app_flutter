import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thekiddle_app/view/main/payroll/payroll_viewmodel.dart';
import 'package:thekiddle_app/view/shared/drawer/drawer_view.dart';

class PayrollView extends StatelessWidget {
  const PayrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PayrollViewModel>.reactive(
      viewModelBuilder: () => PayrollViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.menu, color: Colors.grey),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
            title: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.tag_faces, color: Colors.pink),
                SizedBox(width: 4),
                Text(
                  'Kiddie',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 24,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.grey),
                onPressed: () {
                  // Handle search button press
                },
              ),
            ],
          ),
          drawer: const DrawerView(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD1C4E9),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Text(
                      'Payroll',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: const Color(0xFFFCE4EC), // Add background color here
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: model.payrolls.length,
                    itemBuilder: (context, index) {
                      final payroll = model.payrolls[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Date: ${payroll.date}'),
                                    const SizedBox(height: 8),
                                    Text('Type: ${payroll.type}'),
                                    const SizedBox(height: 8),
                                    Text('Total: ${payroll.total}'),
                                    const SizedBox(height: 3),
                                    Row(
                                      children: [
                                        const Text('Action: '),
                                        ElevatedButton(
                                          onPressed: () {
                                            // Handle download
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blue,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal:
                                                  10.0, // Adjust padding as needed
                                              vertical:
                                                  2.0, // Adjust padding as needed
                                            ),
                                            textStyle: const TextStyle(
                                              fontSize:
                                                  14, // Adjust font size as needed
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      8.0), // Rounded corners
                                            ),
                                          ),
                                          child: const Text(
                                            'Download',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
