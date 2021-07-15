import 'package:flutter/material.dart';

class ElfPanel extends StatefulWidget {
  ElfPanel({@required required this.items, Key? key}) : super(key: key);

  final List<ElfItem> items;

  @override
  State<StatefulWidget> createState() => _ElfPanelState();
}

class _ElfPanelState extends State<ElfPanel> {
  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          clicked = !clicked;
        });
      },
      child: AnimatedPhysicalModel(
        curve: clicked ? Interval(0, 1) : Interval(0.5, 1.0),
        shadowColor: const Color(0xFF000000),
        shape: BoxShape.rectangle,
        duration: Duration(seconds: clicked ? 0 : 1, milliseconds: clicked ? 500 : 0),
        elevation: 8,
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(clicked ? 10 : 100)),
        child: AnimatedContainer(
          curve: clicked ? Interval(0, 1) : Interval(0.5, 1.0),
          duration: Duration(seconds: clicked ? 0 : 1, milliseconds: clicked ? 500 : 0),
          height: clicked ? (widget.items.length / 3).ceil() * 60 : 50,
          width: clicked ? 180 : 50,
          transformAlignment: Alignment.topLeft,
          decoration: BoxDecoration(
            color: clicked ? Colors.white : Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(clicked ? 10 : 100)),
          ),
          child: AnimatedSwitcher(
            duration: Duration(seconds: 1),
            reverseDuration: Duration(milliseconds: 500),
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: CurvedAnimation(parent: animation, curve: clicked ? Interval(0.5, 1.0) : Interval(0, 1)),
                child: child,
              );
            },
            child: clicked
                ? Wrap(
                    children: widget.items,
                  )
                : Container(),
          ),
        ),
      ),
    );
  }
}

class ElfItem extends StatelessWidget {
  factory ElfItem.icon(IconData icon, String title, VoidCallback onTap) {
    return ElfItem(
      builder: (context) {
        return GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Icon(
                  icon,
                  color: Colors.grey,
                  size: 28,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 9,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  ElfItem({required this.builder});

  final Widget Function(BuildContext context) builder;

  @override
  Widget build(BuildContext context) {
    return builder(context);
  }
}
