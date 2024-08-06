import 'package:flutter/material.dart';

class ImageSelector extends StatelessWidget {
  final void Function()? onPressed;
  const ImageSelector({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('There is no images to edit.'),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: onPressed, child: const Text('Select Images'))
        ],
      ),
    );
  }
}