import 'package:stacked/stacked.dart';

class Payroll {
  final String date;
  final String type;
  final String total;

  Payroll({required this.date, required this.type, required this.total});
}

class PayrollViewModel extends BaseViewModel {
  final List<Payroll> _payrolls = [
    Payroll(date: '18/12/2023', type: 'Lorem ipsum', total: 'RM2440'),
    Payroll(date: '18/12/2023', type: 'Lorem ipsum', total: 'RM2440'),
    Payroll(date: '18/12/2023', type: 'Lorem ipsum', total: 'RM2440'),
    Payroll(date: '18/12/2023', type: 'Lorem ipsum', total: 'RM2440'),
    Payroll(date: '18/12/2023', type: 'Lorem ipsum', total: 'RM2440'),
    Payroll(date: '18/12/2023', type: 'Lorem ipsum', total: 'RM2440'),
  ];

  List<Payroll> get payrolls => _payrolls;
}
