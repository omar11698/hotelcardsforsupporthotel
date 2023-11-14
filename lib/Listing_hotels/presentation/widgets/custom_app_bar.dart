import 'package:flutter/material.dart';

class CurvedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> actions;
  const CurvedAppBar({
    Key? key,
    required this.actions,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),),
        backgroundColor: Colors.white,
        shadowColor: Colors.grey.withOpacity(0.5),
        actions: actions,
        elevation: 20,
        automaticallyImplyLeading: false,
      ),
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
