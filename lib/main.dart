import 'dart:io';
import 'package:share_plus/share_plus.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'api_key.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PixabayPage(),
    );
  }
}

class PixabayPage extends StatefulWidget {
  const PixabayPage({super.key});

  @override
  State<PixabayPage> createState() => _PixabayPageState();
}

class _PixabayPageState extends State<PixabayPage> {
  List<PixabayImage> pixabayImages = [];

  Future<void> fetchImages(String text) async {
    final String path =
        'https://pixabay.com/api/?key=$apiKey=$text&image_type=photo&per_page=100';
    final response = await Dio().get(path);
    final List hits = response.data['hits'];
    pixabayImages = hits.map((e) {
      return PixabayImage.fromMap(e);
    }).toList();
    setState(() {});
  }

  Future<void> shareImage(String url) async {
    final response = await Dio().get(
      url,
      options: Options(responseType: ResponseType.bytes),
    );

    final dir = await getTemporaryDirectory();
    final file =
        await File('${dir.path}/image.png').writeAsBytes(response.data);

    await Share.shareFiles([file.path]);
  }

  @override
  void initState() {
    super.initState();
    fetchImages(' ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: TextFormField(
          initialValue: ' ',
          decoration: const InputDecoration(
            fillColor: Colors.white,
            filled: true,
          ),
          onFieldSubmitted: (value) {
            fetchImages(value);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemCount: pixabayImages.length,
          itemBuilder: (context, index) {
            final pixabayImage = pixabayImages[index];
            return InkWell(
              onTap: () async {
                shareImage(pixabayImage.webformatURL);
              },
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    pixabayImage.previewURL,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      color: Colors.black,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            color: Colors.white,
                            Icons.thumb_up_off_alt_rounded,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            '${pixabayImage.likes}',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class PixabayImage {
  final String webformatURL, previewURL;
  final int likes;

  PixabayImage({
    required this.webformatURL,
    required this.previewURL,
    required this.likes,
  });

  factory PixabayImage.fromMap(Map<String, dynamic> image) {
    return PixabayImage(
      webformatURL: image['webformatURL'],
      previewURL: image['previewURL'],
      likes: image['likes'],
    );
  }
}
