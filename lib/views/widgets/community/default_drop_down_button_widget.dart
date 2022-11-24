import 'package:flutter/material.dart';

/// A generic (default) drop down button
class DefaultDropDownButton extends StatelessWidget {
  /// Count of button options
  final int optionsCount;

  /// List of button options
  final List<String> listValues;

  /// Map of (button value)&(value icon)
  final Map<String, IconData> map;

  /// Width of drop down list
  final double width;

  /// Icon of drop down button
  final IconData icon;

  /// Default drop down constructor
  const DefaultDropDownButton(
      {super.key,
      required this.icon,
      required this.optionsCount,
      required this.listValues,
      required this.map,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      icon: Icon(icon),
      items: listValues.map((name) {
        return DropdownMenuItem<String>(
            value: name,
            child: SizedBox(
              height: 20,
              width: width,
              child: Row(
                children: [
                  Icon(
                    map[name],
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 15),
                    ),
                  )
                ],
              ),
            ));
      }).toList(),
      onChanged: (selectedName) {},
    );
  }
}
