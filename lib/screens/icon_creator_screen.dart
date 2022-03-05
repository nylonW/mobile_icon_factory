import 'dart:io';

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
        return DropTarget(
          onDragDone: (details) {
            context
                .read<IconCreatorBloc>()
                .add(IconCreatorFilesDropped(details.files));
          },
          onDragEntered: (details) {
            context
                .read<IconCreatorBloc>()
                .add(const IconCreatorDraggingChanged(true));
          },
          onDragExited: (details) {
            context
                .read<IconCreatorBloc>()
                .add(const IconCreatorDraggingChanged(false));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Center(
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: state.files.isNotEmpty
                        ? Image.file(
                            File(state.files.first.path),
                            fit: BoxFit.cover,
                          )
                        : const DragDropHint(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, bottom: 8.0, top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text('Android'),
                        Checkbox(
                            value: state.androidSelected,
                            onChanged: (value) {
                              if (value == null) {
                                return;
                              }
                              context.read<IconCreatorBloc>().add(
                                  IconCreatorOnAndroidCheckboxChanged(value));
                            }),
                        const SizedBox(
                          width: 16.0,
                        ),
                        const Text('iOS'),
                        Checkbox(
                            value: state.iosSelected,
                            onChanged: (value) {
                              if (value == null) {
                                return;
                              }
                              context
                                  .read<IconCreatorBloc>()
                                  .add(IconCreatorOnIOSCheckboxChanged(value));
                            }),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<IconCreatorBloc>()
                          .add(IconCreatorSubmitted(context));
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Text('Go'),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class DragDropHint extends StatelessWidget {
  const DragDropHint({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Drag & Drop here.',
      ),
    );
  }
}
