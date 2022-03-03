part of 'icon_creator_bloc.dart';

class ImageFile extends Equatable {
  const ImageFile({required this.url});

  final String? url;

  ImageFile copyWith({String? url}) {
    return ImageFile(url: url ?? this.url);
  }

  @override
  List<Object?> get props => [url];
}

class IconCreatorState extends Equatable {
  const IconCreatorState({required this.files, required this.dragging});

  IconCreatorState.initial() : this(files: [], dragging: false);

  final List<ImageFile> files;
  final bool dragging;

  IconCreatorState copyWith({List<ImageFile>? files, bool? dragging}) {
    return IconCreatorState(
      files: files ?? this.files,
      dragging: dragging ?? this.dragging,
    );
  }

  @override
  List<Object> get props => [files, dragging];
}
