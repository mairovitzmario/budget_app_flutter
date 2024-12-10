import 'package:budget/logic/models/category.dart';
import 'package:budget/logic/providers/categories_provider.dart';
import 'package:budget/theme.dart';
import 'package:budget/widgets/appbar_secondary.dart';
import 'package:budget/widgets/lockable_button.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditCategoryPage extends StatefulWidget {
  Category model;
  EditCategoryPage({super.key, required this.model});

  @override
  State<EditCategoryPage> createState() => _EditCategoryPageState();
}

class _EditCategoryPageState extends State<EditCategoryPage> {
  final TextEditingController _nameController = TextEditingController();
  bool _isFormCompleted = false;
  late Color selectedColor;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_validateForm);
    _nameController.text = widget.model.name;
    selectedColor = widget.model.color;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarSecondary(
        title: 'Edit category',
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
                _buildColorField(context),
              ],
            ),
            Column(
              children: [
                LockableButton(
                    title: 'Save',
                    isLocked: _isFormCompleted,
                    onPressedFunc: () => _editCategory()),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _editCategory() {
    context
        .read<CategoriesProvider>()
        .editCategory(widget.model, _nameController.text, selectedColor);
    Navigator.of(context).pop();
  }

  void _validateForm() {
    // IF FORM IS VALID, BUTTON WILL BE ACTIVATED
    setState(() {
      _isFormCompleted = _nameController.text.isNotEmpty;
    });
  }

  GestureDetector _buildColorField(BuildContext context) {
    return GestureDetector(
      onTap: () => _buildColorPicker(context),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: selectedColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Color',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: getAdaptiveColor(selectedColor),
                  ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: getAdaptiveColor(selectedColor),
            )
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
            color: selectedColor,
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
                setState(() => selectedColor = color),
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
