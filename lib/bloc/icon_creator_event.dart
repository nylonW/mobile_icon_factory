part of 'icon_creator_bloc.dart';

abstract class IconCreatorEvent extends Equatable {
  const IconCreatorEvent();

  @override
  List<Object?> get props => [];
}

class IconCreatorFilesDropped extends IconCreatorEvent {
  const IconCreatorFilesDropped(this.files);

  final List<XFile> files;

  @override
  List<Object?> get props => [files];
}

class IconCreatorSubmitted extends IconCreatorEvent {
  const IconCreatorSubmitted(this.context);

  final BuildContext context;
  @override
  List<Object?> get props => [context];
}

class IconCreatorDraggingChanged extends IconCreatorEvent {
  const IconCreatorDraggingChanged(this.dragging);

  final bool dragging;

  @override
  List<Object?> get props => [dragging];
}

class IconCreatorOnAndroidCheckboxChanged extends IconCreatorEvent {
  const IconCreatorOnAndroidCheckboxChanged(this.androidSelected);

  final bool androidSelected;

  @override
  List<Object?> get props => [androidSelected];
}

class IconCreatorOnIOSCheckboxChanged extends IconCreatorEvent {
  const IconCreatorOnIOSCheckboxChanged(this.iosSelected);

  final bool iosSelected;

  @override
  List<Object> get props => [iosSelected];
}
