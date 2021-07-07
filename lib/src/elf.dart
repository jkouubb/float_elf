import 'package:flutter/material.dart';

import 'elf_content.dart';

class Elf {
  static OverlayEntry? _overlayEntry;

  static ElfContent? _elfContent;
  static ElfContent? _feedBack;

  static void show(BuildContext context, Offset initialPosition, ElfContent elfContent, ElfContent feedBack) {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }

    _elfContent = elfContent;
    _feedBack = feedBack;

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          top: initialPosition.dy,
          left: initialPosition.dx,
          child: Draggable(
            ignoringFeedbackSemantics: !(elfContent.runtimeType == feedBack.runtimeType && elfContent.key == feedBack.key),
            child: elfContent,
            feedback: feedBack,
            childWhenDragging: Container(),
            onDragStarted: () {},
            onDragEnd: (DraggableDetails detail) {
              _updateElf(context, detail.offset);
            },
          ),
        );
      },
    );

    OverlayState? overlayState = Overlay.of(context);

    if (overlayState == null) {
      throw Exception('can not insert elf because of null overlayState');
    }

    overlayState.insert(_overlayEntry!);
  }

  static void hide() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  static void _updateElf(BuildContext context, Offset offset) {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          top: offset.dy,
          left: offset.dx,
          child: DragTarget(
            onWillAccept: (data) => true,
            onLeave: (data) {},
            builder: (context, incoming, rejected) {
              return Draggable(
                child: _elfContent!,
                feedback: _feedBack == null ? _elfContent! : _feedBack!,
                childWhenDragging: Container(),
                onDragStarted: () {},
                onDragEnd: (detail) {
                  _updateElf(context, detail.offset);
                },
              );
            },
          ),
        );
      },
    );

    OverlayState? overlayState = Overlay.of(context);

    if (overlayState == null) {
      throw Exception('can not insert elf because of null overlayState');
    }

    overlayState.insert(_overlayEntry!);
  }
}
