import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thekiddle_app/model/moments_model.dart';
import 'package:thekiddle_app/view/main/moments/moments_viewmodel.dart';
import 'package:stacked/stacked.dart';

class AllMomentsTab extends StatelessWidget {
  const AllMomentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MomentsViewModel>.reactive(
      viewModelBuilder: () => MomentsViewModel(),
      builder: (context, model, child) {
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFAE6E9),
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.all(10.0),
          child: FutureBuilder<List<Moment>>(
            future: model.getMoments(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No moments found.'));
              }

              final moments = snapshot.data!;

              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                itemCount: moments.length,
                itemBuilder: (context, index) {
                  final moment = moments[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFAE6E9),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Card(
                      margin: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      moment.images[0]), // Load network image
                                ),
                                const SizedBox(width: 8.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      moment.author,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Published date: ${DateFormat('dd MMM yyyy at hh:mm a').format(moment.publishDate)}',
                                      style: const TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            Divider(
                                color: Colors.grey[
                                    400]), // Add the Divider here with color
                            const SizedBox(height: 8.0),
                            Text(
                              '${moment.studentName.join(', ')} - ${moment.className}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              'Album: ${moment.album}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4.0),
                            ...moment.description.map(
                              (desc) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 1.0),
                                child: Text(desc),
                              ),
                            ),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: moment.images.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8.0,
                                mainAxisSpacing: 8.0,
                              ),
                              itemBuilder: (context, index) {
                                return Image.network(moment
                                    .images[index]); // Load network images
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
