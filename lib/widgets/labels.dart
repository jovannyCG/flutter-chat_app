import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String ruta;
  final String title;
  final String subtitle;
  const Labels(
      {Key? key,
      required this.ruta,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.black54, fontWeight: FontWeight.w300),
          ),
          const SizedBox(height: 120),
          GestureDetector(
            child:  Text(
              subtitle,
              style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w300),
            ),
            onTap: () {
              Navigator.popAndPushNamed(context, ruta);
            },
          ),
        ],
      ),
    );
  }
}
