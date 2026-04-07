import 'package:flutter/material.dart';

class DataTileProps {
  final String title;
  final String value;
  const DataTileProps({required this.title, required this.value});
}

class DataTile extends StatelessWidget {
  final DataTileProps props;
  const DataTile({super.key, required this.props});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: Text('${props.title}: ', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        Expanded(flex: 2, child: Text(props.value, textAlign: TextAlign.end)),
      ],
    );
  }
}
