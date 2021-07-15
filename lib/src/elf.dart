import 'package:flutter/material.dart';

import 'elf_content.dart';

class Elf {
  static OverlayEntry? _overlayEntry;

  static ElfPanel? _elfPanel;

  static bool get hasShow => _overlayEntry != null;

  static void show(BuildContext context, Offset initialPosition, ElfPanel elfPanel) {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }

    _elfPanel = elfPanel;

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          top: initialPosition.dy,
          left: initialPosition.dx,
          child: Draggable(
            ignoringFeedbackSemantics: false,
            child: elfPanel,
            feedback: elfPanel,
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
                ignoringFeedbackSemantics: false,
                child: _elfPanel!,
                feedback: _elfPanel!,
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
