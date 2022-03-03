import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_creator/bloc/icon_creator_bloc.dart';

class IconCreatorScreen extends StatefulWidget {
  const IconCreatorScreen({Key? key}) : super(key: key);

  @override
  State<IconCreatorScreen> createState() => _IconCreatorScreenState();
}

class _IconCreatorScreenState extends State<IconCreatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<IconCreatorBloc, IconCreatorState>(
          builder: (context, state) {
        print(state.dragging);
        return DropTarget(
          onDragDone: (details) {
            context
                .read<IconCreatorBloc>()
                .add(IconCreatorFileDropped(details.files.first.path));
          },
          onDragEntered: (details) {
            context
                .read<IconCreatorBloc>()
                .add(const IconCreatorDraggingChanged(true));
            print('called');
          },
          onDragExited: (details) {
            context
                .read<IconCreatorBloc>()
                .add(const IconCreatorDraggingChanged(false));
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Drag & Drop here.',
                ),
                Text(
                  'dragging: ${state.dragging}',
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.files.length,
                    itemBuilder: (context, index) =>
                        Text(state.files[index].url ?? ''))
              ],
            ),
          ),
        );
      }), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
