import 'package:flutter/material.dart';

typedef ElfContentBuilder = Widget Function(BuildContext buildContext, bool clicked, AnimationController controller);

class ElfContent extends StatefulWidget {
  ElfContent({@required this.builder});

  final ElfContentBuilder? builder;

  @override
  State<StatefulWidget> createState() => _ElfContentState();
}

class _ElfContentState extends State<ElfContent> with SingleTickerProviderStateMixin {
  bool clicked = false;

  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          clicked = !clicked;
        });
      },
      child: widget.builder!(context, clicked, animationController),
    );
  }
}
