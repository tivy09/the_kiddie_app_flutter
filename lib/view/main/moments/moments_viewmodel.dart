import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thekiddle_app/model/moments_model.dart';
import 'package:thekiddle_app/view/main/moments/add_form/add_moment_view.dart';

class MomentsViewModel extends BaseViewModel {
  bool isFolderView = true;

  Future<List<Moment>> getMoments() async {
    // Simulate fetching data from an API or database
    await Future.delayed(const Duration(seconds: 2));

    return [
      Moment(
        author: 'Miss Jasline',
        publishDate: DateTime.parse('2023-12-15T10:00:00'),
        studentName: ['Lylia'],
        className: 'K1 Faith AM',
        album: 'Physical Self - Fine and Gross Motor Skills',
        images: [
          'https://img.freepik.com/free-photo/lovely-newborn-asian-baby-sleeping-furry-cloth_658552-183.jpg',
          'https://img.freepik.com/free-photo/lovely-newborn-asian-baby-sleeping-furry-cloth_658552-183.jpg',
          'https://img.freepik.com/free-photo/lovely-newborn-asian-baby-sleeping-furry-cloth_658552-183.jpg',
          'https://img.freepik.com/free-photo/lovely-newborn-asian-baby-sleeping-furry-cloth_658552-183.jpg',
        ],
        description: [
          'Lylia has good coordination',
          'Lylia has good coordination',
          'Lylia has good coordination',
        ],
      ),
      Moment(
        author: 'Miss Intanon',
        publishDate: DateTime.parse('2023-12-15T09:00:00'),
        studentName: ['Ahmad', 'Abu'],
        className: 'K1 Faith AM',
        album: 'Hari Raya 2023',
        images: [
          'https://img.freepik.com/free-photo/lovely-newborn-asian-baby-sleeping-furry-cloth_658552-183.jpg',
        ],
        description: [''],
      ),
    ];
  }

  void navigateToAddMomentForm(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const AddMomentView()),
    );
  }

  void changeToEventView() {
    isFolderView = false;
    notifyListeners();
  }
}
