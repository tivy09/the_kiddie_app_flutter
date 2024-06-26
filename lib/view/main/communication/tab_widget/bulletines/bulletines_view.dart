import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thekiddle_app/model/conversation/bulletines_model.dart';
import 'package:thekiddle_app/view/main/communication/tab_widget/bulletines/bulletines_viewmodel.dart';

class BulletinsTab extends StatelessWidget {
  final List<Bulletin> bulletins;

  const BulletinsTab({super.key, required this.bulletins});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BulletinViewModel>.reactive(
      viewModelBuilder: () => BulletinViewModel(),
      builder: (context, model, child) {
        return buildListView(context, model, bulletins);
      },
    );
  }
}

Widget buildListView(
    BuildContext context, BulletinViewModel model, List<Bulletin> bulletins) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
                ),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.filter_list),
              label: const Text('Filter'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Expanded(
          child: BulletinListView(bulletins: bulletins, model: model),
        ),
      ],
    ),
  );
}

class BulletinListView extends StatelessWidget {
  final List<Bulletin> bulletins;
  final BulletinViewModel model;

  const BulletinListView(
      {super.key, required this.bulletins, required this.model});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: bulletins.length,
      itemBuilder: (context, index) {
        final bulletin = bulletins[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: GestureDetector(
            // onTap: () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => BulletinDetailView(bulletin: bulletin),
            //     ),
            //   );
            // },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model.monthName(bulletin.date.month)} ${bulletin.date.year}',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            '${bulletin.time}',
                            style: const TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: Container(
                            color: Colors.grey.shade200,
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              bulletin.title,
                              style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          bulletin.description,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const Divider(color: Color(0xFFD9D9D9)),
                        const SizedBox(height: 10),
                        Text(
                          'Warm regards,\n${bulletin.organizer}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '${bulletin.date.day} ${model.monthName(bulletin.date.month)} ${bulletin.date.year}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
