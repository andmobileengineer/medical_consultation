import 'package:flutter/material.dart';

class TransparentAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TransparentAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: const Center(
        child: Padding(
          padding: EdgeInsets.only(right: 55),
          child: Text("Detail Doctor"),
        ),
      ),
      leading: IconButton(
        icon: CircleButton(
          onTap: () => {
            Navigator.of(context).pop()
          },
          iconData: Icons.arrow_back_ios_new,
          key: const Key(""),
        ),
        onPressed: () => {},
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class CircleButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final IconData iconData;

  const CircleButton(
      {required Key key, required this.onTap, required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 35.0;

    return InkResponse(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
        child: SizedBox(
          height: 10,
          width: 10,
          child: Icon(iconData, size: 15, color: Colors.white),
        ),
      ),
    );
  }
}
