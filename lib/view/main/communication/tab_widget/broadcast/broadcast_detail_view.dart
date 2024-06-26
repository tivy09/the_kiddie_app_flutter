import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thekiddle_app/model/conversation/broadcast_model.dart';
import 'package:thekiddle_app/view/main/communication/communication_view.dart';
import 'package:thekiddle_app/view/main/communication/tab_widget/broadcast/broadcast_viewmodel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:photo_view/photo_view.dart';

class BroadcastDetailView extends StatelessWidget {
  final Broadcast broadcast;

  const BroadcastDetailView({super.key, required this.broadcast});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BroadcastsViewModel>.reactive(
      viewModelBuilder: () => BroadcastsViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.pink.shade50,
            elevation: 0,
            toolbarHeight: 0,
          ),
          body: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            color: Colors.pink.shade50, // Background color behind the container
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BackOutlineButtonWidget(),
                    const SizedBox(
                        height: 16), // Add spacing between button and container
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
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(broadcast.avatar),
                                  radius: 30,
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      broadcast.username,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      '${broadcast.datetime.toLocal()}'
                                          .split(' ')[0],
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                    const Text(
                                      '10:15 a.m',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Text(
                              broadcast.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              broadcast.description,
                              style: const TextStyle(fontSize: 16),
                            ),
                            const Divider(color: Color(0xFFD9D9D9)),
                            const SizedBox(height: 10),
                            if (broadcast.attachmentTitle.isNotEmpty) ...[
                              const Text(
                                'Attachment:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  _handleAttachmentClick(
                                      context, broadcast.attachmentUrl);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Image.network(
                                        broadcast.attachmentUrl,
                                        fit: BoxFit.cover,
                                        height: 200,
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          const SizedBox(width: 4),
                                          Expanded(
                                            child:
                                                Text(broadcast.attachmentTitle),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _handleAttachmentClick(BuildContext context, String url) async {
    if (url.endsWith('.jpg') || url.endsWith('.png') || url.endsWith('.jpeg')) {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => ImageViewer(url: url)));
    } else if (url.endsWith('.mp4') || url.endsWith('.mov')) {
      _launchURL(url);
    } else if (url.endsWith('.pdf')) {
      _launchURL(url);
    } else {
      _launchURL(url);
    }
  }

  void _launchURL(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      if (!await launchUrl(uri)) {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}

class ImageViewer extends StatelessWidget {
  final String url;

  const ImageViewer({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Viewer'),
      ),
      body: Center(
        child: PhotoView(
          imageProvider: NetworkImage(url),
          loadingBuilder: (context, event) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorBuilder: (context, error, stackTrace) => const Center(
            child: Text('Failed to load image'),
          ),
        ),
      ),
    );
  }
}

class BackOutlineButtonWidget extends StatelessWidget {
  const BackOutlineButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CommunicationView(initialIndex: 1),
          ),
        );
      },
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        side: const BorderSide(color: Colors.pink, width: 2.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        backgroundColor: Colors.pink.shade50,
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.arrow_back, color: Colors.pink),
          SizedBox(width: 8.0),
          Text(
            'Back',
            style: TextStyle(
              color: Colors.pink,
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}
