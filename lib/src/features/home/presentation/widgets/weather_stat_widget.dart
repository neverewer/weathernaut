import 'package:flutter/material.dart';
import 'package:weathernaut/src/core/presentation/widgets/rounded_box.dart';

class WeatherStatWidget extends StatelessWidget {
  final String leadingImagePath;
  final String label;
  final String value;

  const WeatherStatWidget({
    super.key,
    required this.leadingImagePath,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedBox(
      contentPadding: const EdgeInsets.only(top: 10, right: 35, left: 15, bottom: 10),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading:
            // DecoratedBox(
            //   decoration: const BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.all(Radius.circular(10)),
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.all(4),
            //     child: Image.asset(
            //       leadingImagePath,
            //       width: 35,
            //       height: 35,
            //     ),
            //   ),
            // ),

            RoundedBox(
                borderRadius: 10,
                contentPadding: const EdgeInsets.all(4),
                backgroundColor: Colors.white,
                child: Image.asset(
                  leadingImagePath,
                  width: 35,
                  height: 35,
                )),
        title: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF313341),
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF313341),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
