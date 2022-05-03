import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AccountForm extends Equatable {
  final String label;

  const AccountForm({required this.label});
}

class AccountFormText extends AccountForm {
  @override
  final String label;
  final int maxLines;
  final int maxLength;
  final TextInputType type;
  final bool isFocus;

  const AccountFormText(
      {required this.label, required this.maxLines, required this.maxLength, required this.type, this.isFocus = false})
      : super(label: label);

  @override
  List<Object?> get props => [label, maxLines, maxLength, type, isFocus];
}

class AccountFormDropdown extends AccountForm {
  @override
  final String label;
  final int selectedIndex;
  final List<AccountFormDropdownItem> items;

  final ValueChanged onChanged;

  const AccountFormDropdown({required this.label, required this.items, required this.onChanged, this.selectedIndex = 0})
      : super(label: label);

  @override
  List<Object?> get props => [label, items];
}

class AccountFormDropdownItem extends AccountForm {
  final int index;
  final String label;

  const AccountFormDropdownItem({required this.index, required this.label}) : super(label: label);

  @override
  String toString() => label;

  @override
  List<Object?> get props => [index, label];
}

class AccountFormSwitchButton extends AccountForm {
  @override
  final String label;
  final bool enabled;

  const AccountFormSwitchButton({required this.label, this.enabled = false}) : super(label: label);

  // TODO: onChanged callback

  @override
  List<Object?> get props => [label, enabled];
}

class AccountFormButtonGroup extends AccountForm {
  @override
  final String label;
  final List<AccountFormButton> buttons;

  const AccountFormButtonGroup({required this.label, required this.buttons}) : super(label: label);

  @override
  List<Object?> get props => [label, buttons];
}

class AccountFormButton extends AccountForm {
  @override
  final String label;

  const AccountFormButton({required this.label}) : super(label: label);

  // TODO: onPressed callback

  @override
  List<Object?> get props => [label];
}
