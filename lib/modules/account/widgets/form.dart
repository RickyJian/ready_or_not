import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ready_or_not/modules/account/components/components.dart';
import 'package:ready_or_not/modules/account/controller.dart';
import 'package:ready_or_not/modules/common/common.dart' as common;
import 'package:sizer/sizer.dart';

import 'constant.dart';

class AccountForm extends StatelessWidget {
  final AccountController accountController;
  final List<AccountFormComponent> items;

  const AccountForm({required this.accountController, required this.items});

  @override
  Widget build(context) {
    return Dialog(
      insetPadding: EdgeInsets.only(
        top: common.GlobalUI().getTopPadding(shifted: Constant.formShifted),
      ),
      alignment: Alignment.topCenter,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constant.formBorderRadius),
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
                Constant.formBorderRadius,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0, 0),
                  blurRadius: Constant.formBorderBlurRadius,
                ),
              ],
            ),
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
                                  // TODO: color base on context
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
                                onChanged: (value) => item.onChanged(value!.index),
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
                                onChanged: (value) => item.onChanged(value),
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
                                    fontWeight: FontWeight.w600,
                                    fontSize: Constant.fromButtonTextSize.sp,
                                  ),
                                ),
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
          const Positioned(
            left: Constant.formPadding,
            right: Constant.formPadding,
            child: CircleAvatar(
              // TODO: color base on context
              backgroundColor: common.Themes.lightBackgroundSecondaryColor,
              radius: Constant.formAvatarRadius,
              child: FaIcon(
                FontAwesomeIcons.penToSquare,
                size: Constant.formIconSize,
                // TODO: color base on context
                color: common.Themes.lightTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
