import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ready_or_not/modules/account/account.dart';
import 'package:ready_or_not/modules/common/common.dart' as common;
import 'package:sizer/sizer.dart';

import 'constant.dart';

class AccountCardInfo extends StatelessWidget {
  final AccountCardInfoComponent info;

  const AccountCardInfo({required this.info});

  @override
  Widget build(context) => SliverAppBar(
        leadingWidth: 0,
        title: Text(
          '${common.Message.accountCardInfoTotal.tr} ${info.total}',
          style: TextStyle(
            fontSize: Constant.formTextSize.sp,
          ),
        ),
        elevation: 0,
        pinned: true,
        actions: [
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  common.Message.accountCardInfoEnabled.tr,
                  style: TextStyle(
                    // TODO: color from context
                    color: common.Themes.lightTextColor,
                    fontSize: Constant.formTextSize.sp,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Switch(
                  value: info.enabled,
                  onChanged: info.onChanged,
                ),
              ),
            ],
          )
        ],
        backgroundColor: Colors.white,
      );
}

// TODO: disabled card color
class AccountCard extends StatelessWidget {
  final AccountController _accountController = Get.put(AccountController());
  final AccountCardComponent account;

  AccountCard({required this.account});

  @override
  Widget build(context) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Constant.cardPaddingHorizontal.w,
          vertical: Constant.cardPaddingVertical.h,
        ),
        child: SizedBox(
          height: Constant.cardHeight.h,
          width: Constant.cardWidth.w,
          child: GestureDetector(
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(common.Constant.cardBorderRadius),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 2,
                    // TODO: change to chart
                    child: Stack(
                      alignment: Alignment.topRight,
                      fit: StackFit.expand,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(255, 242, 218, 1),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(common.Constant.cardBorderRadius),
                              topRight: Radius.circular(common.Constant.cardBorderRadius),
                            ),
                          ),
                        ),
                        Positioned(
                          right: Constant.cardSettingLeft.w,
                          child: IconButton(
                            icon: Icon(
                              Icons.settings_outlined,
                              size: Constant.cardSettingIconSize.sp,
                            ),
                            onPressed: () => Get.generalDialog(
                              pageBuilder: (context, animation, secondaryAnimation) => GetX<AccountController>(
                                init: _accountController,
                                builder: (account) => AccountForm(
                                  items: [
                                    AccountFormText(
                                      controller: _accountController.accountFormNameController,
                                      label: common.Message.accountFormName.tr,
                                      maxLength: 10,
                                      maxLines: 1,
                                      isFocus: true,
                                      type: TextInputType.text,
                                      hintText: common.Message.accountFormNameHintText.tr,
                                      errorMessage: _accountController.accountFormNameErrorMessage.value,
                                    ),
                                    AccountFormText(
                                      controller: _accountController.accountFormPriceController,
                                      label: common.Message.accountFormPrice.tr,
                                      maxLength: 8,
                                      maxLines: 1,
                                      type: TextInputType.number,
                                      hintText: common.Message.accountFormPriceHintText.tr,
                                      errorMessage: _accountController.accountFormPriceErrorMessage.value,
                                    ),
                                    AccountFormDropdown(
                                      label: common.Message.accountFormType.tr,
                                      selectedIndex: account.accountTypeSelected.value,
                                      items: [
                                        AccountFormDropdownItem(
                                          index: common.CurrencyType.normal.index,
                                          label: common.Message.currencyTypeNormal.tr,
                                        ),
                                        AccountFormDropdownItem(
                                          index: common.CurrencyType.special.index,
                                          label: common.Message.currencyTypeSpecial.tr,
                                        ),
                                      ],
                                      // TODO: handle convert exception
                                      onChanged: (value) =>
                                          account.onChangeType(common.Util.convertToCurrencyType(value)),
                                    ),
                                    AccountFormDropdown(
                                      label: common.Message.accountFormUnit.tr,
                                      selectedIndex: account.accountUnitSelected.value,
                                      // TODO: show currencies according to type
                                      items: _accountController
                                          .listCurrencies(
                                              type: common.Util.convertToCurrencyType(
                                                  _accountController.accountTypeSelected.value))
                                          .asMap()
                                          .entries
                                          .map(
                                            (entry) => AccountFormDropdownItem(
                                              index: entry.key,
                                              label: entry.value.name,
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (value) => account.onChangeUnit(value),
                                    ),
                                    AccountFormSwitchButton(
                                      label: common.Message.accountFormEnabled.tr,
                                      enabled: account.accountEnabledSelected.value,
                                      onChanged: (enabled) => account.onChangeEnabled(enabled),
                                    ),
                                    AccountFormText(
                                      controller: _accountController.accountMemoController,
                                      label: common.Message.accountFormMemo.tr,
                                      maxLength: 50,
                                      maxLines: 4,
                                      type: TextInputType.text,
                                      hintText: common.Message.accountFormMemoHintText.tr,
                                    ),
                                    AccountFormButtonGroup(
                                      label: common.Message.accountFormButtonGroup.tr,
                                      buttons: [
                                        AccountFormButton(
                                          label: common.Message.accountFormButtonClose.tr,
                                          onPressed: () {
                                            _accountController.resetForm();
                                            Get.back();
                                          },
                                        ),
                                        AccountFormButton(
                                          label: common.Message.accountFormButtonSave.tr,
                                          onPressed: () {
                                            account.createAccount();
                                            // Get.back();
                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(common.Constant.cardBorderRadius),
                              ),
                            ),
                            child: Icon(
                              account.type == common.CurrencyType.normal
                                  ? Icons.monetization_on_outlined
                                  : Icons.cloud_queue_outlined,
                              size: Constant.cardIconSize.sp,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                account.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Constant.cardAccountPrimaryText.sp,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: Constant.cardAccountCenterTopPadding.h,
                                  right: Constant.cardAccountCenterRightPadding.w,
                                ),
                                child: Text(
                                  account.memo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    // TODO: color from context
                                    color: common.Themes.lightTextSecondaryColor,
                                    fontSize: Constant.cardAccountSecondaryText.sp,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(common.Constant.cardBorderRadius),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: 5.w,
                                  ),
                                  child: Text(
                                    account.amount.abs().toDouble().toString(),
                                    style: TextStyle(
                                      // TODO: color from context
                                      color: account.amount.isNegative
                                          ? common.Themes.lightNegativeColor
                                          : common.Themes.lightPositiveColor,
                                      fontSize: Constant.cardAccountPrimaryText.sp,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: Constant.cardAccountRightTopPadding.h,
                                    right: Constant.cardAccountRightRightPadding.w,
                                  ),
                                  child: Text(
                                    account.unit,
                                    style: TextStyle(
                                      // TODO: color from context
                                      color: common.Themes.lightTextSecondaryColor,
                                      fontSize: Constant.cardAccountSecondaryText.sp,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              // TODO: go to detail page
              print('go to detail page');
            },
          ),
        ),
      );
}
