import 'package:flutter/material.dart';
import 'package:flutter_image_compress_app/app/controllers/image_controller.dart';
import 'package:provider/provider.dart';

class ImageView extends StatelessWidget {
  const ImageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageController = Provider.of<ImageController>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  imageController.originalImage != null
                      ? Center(
                          child: Image.file(
                            imageController.originalImage!,
                            height: 180,
                            width: 180,
                          ),
                        )
                      : const SizedBox(),
                  Text('Original Image',
                      style: Theme.of(context).textTheme.headline6),
                ],
              ),
              const SizedBox(width: 10),
              Column(
                children: [
                  imageController.compressedImage != null
                      ? Center(
                          child: Image.file(
                            imageController.compressedImage!,
                            height: 180,
                            width: 180,
                          ),
                        )
                      : const SizedBox(),
                  Text('Compressed Image',
                      style: Theme.of(context).textTheme.headline6),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: imageController.pickImage,
              child: const Text('Pick Image'),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: imageController.compressImage,
              child: const Text('Compress Image'),
            ),
          ),
        ],
      ),
    );
  }
}
