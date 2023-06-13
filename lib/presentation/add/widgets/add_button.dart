import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final Function(int index)? onTap;

  const AddButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 65),
      child: FloatingActionButton(
        onPressed: () {},
        elevation: 8.0,
        child: IconButton(
          onPressed: () => {},
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}
