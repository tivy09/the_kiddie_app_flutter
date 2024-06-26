import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thekiddle_app/model/conversation/broadcast_model.dart';
import 'package:thekiddle_app/view/main/communication/tab_widget/broadcast/add_broadcast_view.dart';

class BroadcastsViewModel extends BaseViewModel {
  bool _isDetailView = false;
  Broadcast? _selectedBroadcast;

  bool get isDetailView => _isDetailView;
  Broadcast? get selectedBroadcast => _selectedBroadcast;

  void showDetailView(Broadcast broadcast) {
    _selectedBroadcast = broadcast;
    _isDetailView = true;
    notifyListeners();
  }

  void showListView() {
    _isDetailView = false;
    _selectedBroadcast = null;
    notifyListeners();
  }

  void navigateToAddBroadcast(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const AddBroadcastView()),
    );
  }
}
