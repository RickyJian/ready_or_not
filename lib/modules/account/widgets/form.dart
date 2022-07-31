import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ready_or_not/modules/account/components/components.dart';
import 'package:ready_or_not/modules/common/common.dart' as common;
import 'package:sizer/sizer.dart';

import 'constant.dart';

class AccountForm extends StatelessWidget {
  final List<AccountFormComponent> items;
  final FocusScopeNode node = FocusScopeNode();

  AccountForm({required this.items});

  @override
  Widget build(context) {
    return Dialog(
      insetPadding: EdgeInsets.only(
        top: common.GlobalUI().getTopPadding(shifted: Constant.formShifted),
      ),
      alignment: Alignment.topCenter,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(common.Constant.cardBorderRadius),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: Constant.formTopPadding,
              left: Constant.formPadding,
              right: Constant.formPadding,
              bottom: Constant.formPadding,
            ),
            margin: const EdgeInsets.only(
              top: Constant.formAvatarRadius,
            ),
            height: Constant.formHeight.h,
            width: Constant.formWidth.w,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                common.Constant.cardBorderRadius,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black45,
                  offset: Offset(0, 0),
                  blurRadius: common.Constant.cardBorderRadius,
                ),
              ],
            ),
            child: FocusScope(
              node: node,
              child: ScrollConfiguration(
                behavior: common.GlowlessScrollBehavior(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: items.map(
                      (item) {
                        if (item is AccountFormText) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(
                                    top: Constant.formTextMargin.h,
                                  ),
                                  child: Text(
                                    item.label,
                                    style: TextStyle(
                                      fontSize: Constant.formTextSize.sp,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  alignment: Alignment.bottomLeft,
                                  child: TextFormField(
                                    style: TextStyle(
                                      fontSize: Constant.formTextSize.sp,
                                    ),
                                    controller: item.controller,
                                    autofocus: item.isFocus,
                                    maxLines: item.maxLines,
                                    maxLength: item.maxLength,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      hintText: item.hintText,
                                      errorText: item.errorMessage?.isEmpty ?? false ? null : item.errorMessage,
                                    ),
                                    keyboardType: item.type,
                                    onEditingComplete: onEditComplete,
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else if (item is AccountFormDropdown) {
                          return Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    item.label,
                                    style: TextStyle(
                                      fontSize: Constant.formTextSize.sp,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  alignment: Alignment.bottomLeft,
                                  child: DropdownButton<AccountFormDropdownItem>(
                                    iconEnabledColor: common.Themes.lightIconColor,
                                    underline: Container(
                                      height: 1,
                                      // TODO: dark mode
                                      //   Get.isDarkMode? common.Themes.darkIconColor: common.Themes.lightIconColor,
                                      color: common.Themes.lightIconColor,
                                    ),
                                    isExpanded: true,
                                    value: item.items[item.selectedIndex],
                                    items: item.items
                                        .map(
                                          (currency) => DropdownMenuItem(
                                            value: currency,
                                            child: Text(
                                              currency.toString(),
                                              style: TextStyle(
                                                fontSize: Constant.formTextSize.sp,
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (value) {
                                      item.onChanged(value!.index);
                                    },
                                    onTap: onEditComplete,
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else if (item is AccountFormSwitchButton) {
                          return Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    item.label,
                                    style: TextStyle(
                                      fontSize: Constant.formTextSize.sp,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Switch(
                                    value: item.enabled,
                                    focusNode: FocusNode(skipTraversal: true),
                                    onChanged: (value) {
                                      item.onChanged(value);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else if (item is AccountFormButtonGroup) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: item.buttons
                                .map(
                                  (button) => TextButton(
                                    child: Text(
                                      button.label,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: Constant.fromButtonTextSize.sp,
                                      ),
                                    ),
                                    focusNode: FocusNode(skipTraversal: true),
                                    onPressed: () => button.onPressed(),
                                  ),
                                )
                                .toList(),
                          );
                        }
                        // TODO: throw ui exception
                        return Container();
                      },
                    ).toList(),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: Constant.formPadding,
            right: Constant.formPadding,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    offset: Offset(0, 0),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: const CircleAvatar(
                // TODO: color base on context
                backgroundColor: common.Themes.lightBackgroundColor,
                radius: Constant.formAvatarRadius,
                child: FaIcon(
                  FontAwesomeIcons.penToSquare,
                  size: Constant.formIconSize,
                  // TODO: color base on context
                  color: common.Themes.lightPrimaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  onEditComplete() => node.traversalChildren.last.hasPrimaryFocus ? null : node.nextFocus();
}
