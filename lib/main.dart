import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
  List hits = [];

  Future<void> fetchImages(String text) async {
    String path =
        'https://pixabay.com/api/?key=$apiKey=$text&image_type=photo&per_page=100';
    Response response = await Dio().get(path);
    hits = response.data['hits'];
    setState(() {});
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
          itemCount: hits.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> hit = hits[index];
            return Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  hit['previewURL'],
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
                          '${hit['likes']}',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
