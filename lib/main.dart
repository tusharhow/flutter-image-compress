import 'package:flutter/material.dart';
import 'package:flutter_image_compress_app/app/controllers/image_controller.dart';
import 'package:provider/provider.dart';
import 'app/views/image_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ImageController()),
      ],
      child: MaterialApp(
        title: 'Flutter Image Compress App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: const ImageView(),
      ),
    );
  }
}
