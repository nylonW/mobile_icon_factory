part of 'icon_creator_bloc.dart';

abstract class IconCreatorEvent extends Equatable {
  const IconCreatorEvent();

  @override
  List<Object?> get props => [];
}

class IconCreatorFileDropped extends IconCreatorEvent {
  const IconCreatorFileDropped(this.url);

  final String url;

  @override
  List<Object?> get props => [url];
}

class IconCreatorSubmitted extends IconCreatorEvent {
  const IconCreatorSubmitted();

  @override
  List<Object?> get props => [];
}

class IconCreatorDraggingChanged extends IconCreatorEvent {
  const IconCreatorDraggingChanged(this.dragging);

  final bool dragging;

  @override
  List<Object?> get props => [dragging];
}
