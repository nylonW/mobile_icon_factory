import 'dart:io';

import 'package:cross_file/cross_file.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_creator/models/contents.dart';
import 'package:image/image.dart';
import 'package:open_file/open_file.dart';

part 'icon_creator_event.dart';
part 'icon_creator_state.dart';

class IconCreatorBloc extends Bloc<IconCreatorEvent, IconCreatorState> {
  IconCreatorBloc() : super(IconCreatorState.initial()) {
    on<IconCreatorFilesDropped>((event, emit) {
      emit(state.copyWith(files: [...state.files, ...event.files]));
    });

    on<IconCreatorSubmitted>((event, emit) async {
      await onIconCreatorSubmitted(event, emit);
    });

    on<IconCreatorDraggingChanged>((event, emit) {
      emit(state.copyWith(dragging: event.dragging));
    });
    on<IconCreatorOnAndroidCheckboxChanged>((event, emit) =>
        emit(state.copyWith(androidSelected: event.androidSelected)));
    on<IconCreatorOnIOSCheckboxChanged>(
        (event, emit) => emit(state.copyWith(iosSelected: event.iosSelected)));
  }

  onIconCreatorSubmitted(
      IconCreatorSubmitted event, Emitter<IconCreatorState> emit) async {
    String? path = await FilePicker.platform.getDirectoryPath();

    if (path != null) {
      emit(state.copyWith(outputPath: path));

      for (var file in state.files) {
        final image = decodeImage(File(file.path).readAsBytesSync());
        if (image == null) {
          return;
        }
        final iosImages = Contents.standard;
        await Future.wait(iosImages.images.map((iosSize) => resizeAndWriteImage(
            image, iosSize.imageSize.toInt(), path, iosSize.filename)));
      }

      await OpenFile.open('$path\\');
    }
  }

  Future<void> resizeAndWriteImage(
      image, int size, String path, String name) async {
    final resizedImage = copyResize(image,
        width: size, height: size, interpolation: Interpolation.average);
    await File(path + '/$name').writeAsBytes(encodePng(resizedImage));
  }
}
