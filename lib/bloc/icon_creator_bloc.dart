import 'package:cross_file/cross_file.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'icon_creator_event.dart';
part 'icon_creator_state.dart';

class IconCreatorBloc extends Bloc<IconCreatorEvent, IconCreatorState> {
  IconCreatorBloc() : super(IconCreatorState.initial()) {
    on<IconCreatorFilesDropped>((event, emit) {
      emit(state.copyWith(files: [...event.files, ...state.files]));
    });

    on<IconCreatorSubmitted>((event, emit) async {
      String? path = await FilePicker.platform.getDirectoryPath();

      if (path != null) {
        emit(state.copyWith(outputPath: path));
      }
    });

    on<IconCreatorDraggingChanged>((event, emit) {
      emit(state.copyWith(dragging: event.dragging));
    });
    on<IconCreatorOnAndroidCheckboxChanged>((event, emit) =>
        emit(state.copyWith(androidSelected: event.androidSelected)));
    on<IconCreatorOnIOSCheckboxChanged>(
        (event, emit) => emit(state.copyWith(iosSelected: event.iosSelected)));
  }
}
