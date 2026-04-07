import 'package:flutter/material.dart';

class AppTileProps {
  final Widget child;
  const AppTileProps({required this.child});
}

class AppTile extends StatelessWidget {
  final AppTileProps props;
  const AppTile({super.key, required this.props});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      width: double.infinity,
      child: props.child,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey, width: 1)),
      ),
    );
  }
}
