import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app_task/presentation/pages/home/component/image_gallery_view.dart';
import 'package:gallery_app_task/presentation/pages/home/component/image_selector.dart';
import 'package:gallery_app_task/presentation/pages/home/cubit/gallery_cubit_bloc.dart';
import 'package:gallery_app_task/presentation/pages/home/cubit/gallery_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
          create: (context) => GalleryCubitBloc(Initial())..fetchImages(),
          child: BlocConsumer<GalleryCubitBloc, GalleryState>(
            listener: (context, state) {
              if (state is Failure) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.error.message)));
              }
            },
            builder: (context, state) {
              if (state is Success) {
                return ImageGalleryView(selectedImages: state.files);
              }
              if (state is Loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is Failure) {
                return ImageSelector(
                  onPressed: () {
                    context.read<GalleryCubitBloc>().getImages();
                  },
                );
              }
              return const Center(
                child: Text('Something went wrong'),
              );
            },
          ),
        ));
  }
}
