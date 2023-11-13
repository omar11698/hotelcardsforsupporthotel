import 'package:flutter/material.dart';

class CurvedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  final double elevation;

  const CurvedAppBar({
    Key? key,
    required this.title,
    required this.actions,
    required this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all( Radius.circular(20.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: PhysicalModel(
          color: Colors.black,
          elevation: 10,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          shadowColor: Colors.grey.withOpacity(0.5),
          child: AppBar(
            backgroundColor: Colors.white,
            title: Text(title),
            shadowColor: Colors.grey.withOpacity(0.5),

            actions: actions,
            elevation: elevation,
            automaticallyImplyLeading: false,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
