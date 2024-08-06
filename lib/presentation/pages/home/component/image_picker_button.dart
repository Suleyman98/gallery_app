import 'package:animated_expandable_fab/expandable_fab/action_button.dart';
import 'package:animated_expandable_fab/expandable_fab/expandable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app_task/presentation/pages/home/cubit/gallery_cubit_bloc.dart';

class ImagePickerButton extends StatelessWidget {
  const ImagePickerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ExpandableFab(
        distance: 70,
        openIcon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        closeIcon: const Icon(Icons.close),
        children: [
          ActionButton(
            color: Colors.black,
            icon: const Icon(
              Icons.image_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              context.read<GalleryCubitBloc>().getImages();
            },
          ),
        ],
      ),
    );
  }
}
