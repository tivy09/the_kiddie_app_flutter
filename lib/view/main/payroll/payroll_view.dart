import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thekiddle_app/view/main/payroll/payroll_viewmodel.dart';
import 'package:thekiddle_app/view/shared/drawer/drawer_view.dart';
import 'package:thekiddle_app/view/shared/header/header.dart';
import 'package:thekiddle_app/widget/others/page_title.dart';

class PayrollView extends StatelessWidget {
  const PayrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PayrollViewModel>.reactive(
      viewModelBuilder: () => PayrollViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Header(),
          ),
          drawer: const DrawerView(),
          body: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: PageTitle(title: 'Payroll'),
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
