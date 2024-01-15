import 'dart:io';
import 'package:bloc_practice/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_practice/bloc/image_picker/image_picker_event.dart';
import 'package:bloc_practice/bloc/image_picker/image_picker_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Picker Example"),
      ),
      body: Center(
        child: BlocBuilder<ImagePickerBloc, ImagePickerStates>(
          builder: (context, state) {
            if (state.file == null) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(

                      onTap: () {
                        context.read<ImagePickerBloc>().add(CameraCapture());
                      },

                    child: const CircleAvatar(
                      child: Icon(Icons.camera),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  GestureDetector(
                    onTap: () {
                      context.read<ImagePickerBloc>().add(ImageFromGallery());
                    },
                    child: const CircleAvatar(
                      child: Icon(Icons.image),
                    ),
                  ),
                ],
              );
            } else {
              return Image.file(File(state.file!.path.toString()));
            }
          },
        ),
      ),
    );
  }
}
