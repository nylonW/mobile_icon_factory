part of 'icon_creator_bloc.dart';

class IconCreatorState extends Equatable {
  const IconCreatorState(
      {required this.files,
      required this.dragging,
      required this.androidSelected,
      required this.iosSelected});

  IconCreatorState.initial()
      : this(
            files: [],
            dragging: false,
            androidSelected: true,
            iosSelected: true);

  final List<XFile> files;
  final bool dragging;
  final bool androidSelected;
  final bool iosSelected;

  IconCreatorState copyWith(
      {List<XFile>? files,
      bool? dragging,
      bool? androidSelected,
      bool? iosSelected}) {
    return IconCreatorState(
      files: files ?? this.files,
      dragging: dragging ?? this.dragging,
      androidSelected: androidSelected ?? this.androidSelected,
      iosSelected: iosSelected ?? this.iosSelected,
    );
  }

  @override
  List<Object> get props => [files, dragging];
}
