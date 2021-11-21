// Below defines info enum and const

enum accountInfoType { assets, liabilities, netAssets }

// TODO: i18n
extension ToString on accountInfoType {
  String string() {
    switch (this) {
      case accountInfoType.assets:
        return 'Assets';
      case accountInfoType.liabilities:
        return 'Liability';
      case accountInfoType.netAssets:
        return 'Net Assets';
    }
  }
}
