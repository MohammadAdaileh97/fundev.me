import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../multiselect/src/multi_dropdown.dart';

class CustomMultiDropdown<T extends Object> extends StatelessWidget {
  final List<DropdownItem<T>> items;

  final String hintText;
  final OnSelectionChanged<T>? onSelectionChange;

  const CustomMultiDropdown({
    super.key,
    required this.items,

    required this.onSelectionChange,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return MultiDropdown<T>(
      searchEnabled: true,
      closeOnBackButton: true,
      singleSelect: true,
      dropdownItemDecoration: DropdownItemDecoration(
        backgroundColor: Theme.of(context).colorScheme.background,
        textColor: Theme.of(context).textTheme.bodyMedium!.color,
      ),
      dropdownDecoration: DropdownDecoration(
        borderRadius: BorderRadius.circular(12),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      fieldDecoration: FieldDecoration(
        showClearIcon: false,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
        ),

        hintText: hintText,
      ),
      items: items,
      searchDecoration: SearchFieldDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: AppLocalizations.of(context)!.search,
        searchIcon: Icon(
          Icons.search,
          color: Theme.of(context).colorScheme.secondaryContainer,
        ),
      ),
      onSelectionChange: onSelectionChange,
    );
  }
}
