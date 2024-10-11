import 'package:budget/logic/models/category.dart';
import 'package:budget/logic/models/item.dart';
import 'package:budget/logic/providers/categories_provider.dart';
import 'package:budget/logic/utils/dashboard_utils.dart';
import 'package:budget/theme.dart';
import 'package:budget/widgets/appbar_secondary.dart';
import 'package:budget/widgets/lockable_add_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AddExpensePage extends StatefulWidget {
  const AddExpensePage({super.key});

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  Category? selectedValue;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  bool _isFormCompleted = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_validateForm);
    _priceController.addListener(_validateForm);
    _quantityController.addListener(_validateForm);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarSecondary(title: 'Add an expense or item'),
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
                Row(
                  children: [
                    Flexible(
                      child: _buildPriceField(context),
                    ),
                    const SizedBox(width: 20),
                    Flexible(
                      child: _buildQuantityField(context),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _dropDownMenu(context),
              ],
            ),
            Column(
              children: [
                LockableAddButton(
                    isLocked: _isFormCompleted, onPressedFunc: _addItem),
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

  void _validateForm() {
    // IF FORM IS VALID, BUTTON WILL BE ACTIVATED
    setState(() {
      _isFormCompleted = _nameController.text.isNotEmpty &&
          _priceController.text.isNotEmpty &&
          _quantityController.text.isNotEmpty &&
          selectedValue != null;
    });
  }

  void _addItem() {
    context.read<CategoriesProvider>().addItemToCategory(
        context,
        selectedValue,
        Item(
            name: _nameController.text,
            price: double.parse(_priceController.text),
            quantity: int.parse(_quantityController.text)));
    Navigator.of(context).pop();
  }

  TextField _buildQuantityField(BuildContext context) {
    return TextField(
      controller: _quantityController,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
      decoration: buildTextFieldInputDecoration(context, 'Quantity').copyWith(
        suffixText: 'pcs.',
        suffixStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
      ),
    );
  }

  TextField _buildPriceField(BuildContext context) {
    return TextField(
      controller: _priceController,
      keyboardType: const TextInputType.numberWithOptions(
        decimal: true,
      ),
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp(r'^\d+\.?\d{0,2}'),
        ),
      ],
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
      decoration: buildTextFieldInputDecoration(context, 'Price'),
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

  DropdownButtonFormField<Category> _dropDownMenu(BuildContext context) {
    final categoriesList = context.watch<CategoriesProvider>().categoriesList;

    return DropdownButtonFormField<Category>(
      value: selectedValue,
      icon: Icon(
        Icons.arrow_drop_down,
        color: Theme.of(context).colorScheme.secondary,
      ),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          labelText: 'Select Category',
          labelStyle: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Theme.of(context).colorScheme.secondary)),
      items: categoriesList.map<DropdownMenuItem<Category>>((Category value) {
        return DropdownMenuItem<Category>(
          value: value,
          child: Row(
            children: [
              Icon(
                Icons.category,
                color: value.color,
                size: 18,
              ),
              const SizedBox(width: 10),
              Text(
                value.name,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: value.color),
              ),
            ],
          ),
        );
      }).toList(),
      onChanged: (Category? newValue) {
        setState(() {
          selectedValue = newValue;
          _validateForm(); // Call this to check if form is valid
        });
      },
    );
  }
}
