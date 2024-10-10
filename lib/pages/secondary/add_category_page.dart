import 'package:budget/theme.dart';
import 'package:budget/widgets/appbar_secondary.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({super.key});

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  final TextEditingController _nameController = TextEditingController();
  Color screenPickerColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarSecondary(
        title: 'Add a category',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 15),
                _buildNameField(context),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () => _buildColorPicker(context),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: screenPickerColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Color',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                                color:
                                    screenPickerColor.computeLuminance() <= 0.5
                                        ? Colors.white
                                        : Colors.black,
                              ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: screenPickerColor.computeLuminance() <= 0.5
                              ? Colors.white
                              : Colors.black,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const Column(
              children: [
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _buildColorPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          height: 450,
          child: ColorPicker(
            // Use the screenPickerColor as start and active color.
            color: screenPickerColor,
            pickersEnabled: const <ColorPickerType, bool>{
              ColorPickerType.both: false,
              ColorPickerType.primary: true,
              ColorPickerType.accent: false,
              ColorPickerType.bw: false,
              ColorPickerType.custom: false,
              ColorPickerType.customSecondary: false,
              ColorPickerType.wheel: false
            },
            // Update the screenPickerColor using the callback.
            onColorChanged: (Color color) =>
                setState(() => screenPickerColor = color),
            width: 44,
            height: 44,
            borderRadius: 22,
            heading: Container(
              child: Text(
                'Select color',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            subheading: Container(
              margin: EdgeInsets.only(
                top: 20,
              ),
              child: Text(
                'Select shade',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextField _buildNameField(BuildContext context) {
    return TextField(
      controller: _nameController,
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(color: Theme.of(context).colorScheme.primary),
      decoration: buildTextFieldInputDecoration(context, 'Name'),
    );
  }
}
