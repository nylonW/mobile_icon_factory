import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'icon_creator_event.dart';
part 'icon_creator_state.dart';

class IconCreatorBloc extends Bloc<IconCreatorEvent, IconCreatorState> {
  IconCreatorBloc() : super(IconCreatorState.initial()) {
    on<IconCreatorFileDropped>((event, emit) {
      emit(state.copyWith(files: [ImageFile(url: event.url), ...state.files]));
    });

    on<IconCreatorSubmitted>((event, emit) {
      print('submitted');
    });

    on<IconCreatorDraggingChanged>((event, emit) {
      emit(state.copyWith(dragging: event.dragging));
    });
  }
}
