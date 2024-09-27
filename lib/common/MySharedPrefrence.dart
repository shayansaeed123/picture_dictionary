// import 'dart:core';

// import 'package:get_storage/get_storage.dart';

// class MySharedPrefrence {
  
//    static GetStorage? preferences;

//   static MySharedPrefrence? _instance;

//   MySharedPrefrence._() {
//     // Ensure the storage instance is created only once
//     preferences = GetStorage('MyPref');
//   }

//   factory MySharedPrefrence() {
//     _instance ??= MySharedPrefrence._();
//     return _instance!;
//   }
//   // static var preferences;

//   // static MySharedPrefrence? _instance;

//   // MySharedPrefrence._() {
//   //   preferences = () => GetStorage('MyPref');
//   // }

//   // factory MySharedPrefrence() {
//   //   _instance ??= new MySharedPrefrence._();
//   //   // since you are sure you will return non-null value, add '!' operator
//   //   return _instance!;
//   // }

//   bool getUserLoginStatus() {
//     return false.val('user_login_status', getBox: preferences).val;
//   }

//   void setUserLoginStatus(bool? alarmStatus) {
//     false.val('user_login_status', getBox: preferences).val =
//         alarmStatus ?? false;
//   }




//   String get_cat_id() {
//     return ''.val('cat_id', getBox: preferences).val;
//   }

//   void set_cat_id(String? cat_id) {
//     ''.val('cat_id', getBox: preferences).val = cat_id ?? '';
//   }


//   String get_versioncode() {
//     return ''.val('version_code', getBox: preferences).val;
//   }

//   void set_versioncode(String? version_code) {
//     ''.val('version_code', getBox: preferences).val = version_code ?? '';
//   }





//   void set_user_token(String? user_token) {
//     ''.val('user_token', getBox: preferences).val = user_token ?? '';
//   }

//   String get_user_status1() {
//     return '0'.val('status1', getBox: preferences).val;
//   }
//   void set_user_status1(String? user_token) {
//     '0'.val('status1', getBox: preferences).val = user_token ?? '0';
//   }

//   String get_user_token() {
//     return ''.val('user_token', getBox: preferences).val;
//   }

//   void set_shop_name(String? shop_name) {
//     ''.val('shop_name', getBox: preferences).val = shop_name ?? '';
//   }

//   String get_shop_name() {
//     return ''.val('shop_name', getBox: preferences).val;
//   }

//   void set_user_email(String? user_name) {
//     ''.val('user_email', getBox: preferences).val = user_name ?? '';
//   }

//   String get_user_email() {
//     return ''.val('user_email', getBox: preferences).val;
//   }

//   void set_user_number(String? user_name) {
//     ''.val('user_number', getBox: preferences).val = user_name ?? '';
//   }

//   String get_user_number() {
//     return ''.val('user_number', getBox: preferences).val;
//   }

// int get_user_id() {
//     return int.tryParse(preferences.read('user_id') ?? '0') ?? 0;
//   }

//   void set_user_id(int userId) {
//     preferences.write('user_id', userId.toString());
//   }


//   // void set_user_id(int? user_id) {
//   //   0.val('user_id', getBox: preferences).val = user_id ?? 0;
//   // }

//   // int get_user_id() {
//   //   return 0.val('user_id', getBox: preferences).val;
//   // }

//   void set_user_type(String? user_type) {
//     ''.val('user_type', getBox: preferences).val = user_type ?? '';
//   }

//   String get_user_type() {
//     return ''.val('user_type', getBox: preferences).val;
//   }

//   void set_device_token(String? user_token) {
//     ''.val('device_token', getBox: preferences).val = user_token ?? '';
//   }

//   String get_device_token() {
//     return ''.val('device_token', getBox: preferences).val;
//   }

//   // Future<void> setVersionName() async {
//   //   await PackageInfo.fromPlatform().then((PackageInfo? packageInfo) {
//   //     String? version = packageInfo?.version;
//   //     ''.val('versionName', getBox: preferences).val = version ?? '';
//   //   });
//   // }

//   String getVersionName() {
//     return ''.val('versionName', getBox: preferences).val;
//   }

//   void setUserCurrentLocation(String? userCurrentLocation) {
//     ''.val('user_current_location', getBox: preferences).val =
//         userCurrentLocation ?? '';
//   }

//   String getUserCurrentLocation() {
//     return ''.val('user_current_location', getBox: preferences).val;
//   }

//   void set_user_name(String? user_name) {
//     ''.val('user_name', getBox: preferences).val = user_name ?? '';
//   }

//   String get_user_name() {
//     return ''.val('user_name', getBox: preferences).val;
//   }

//   void set_user_cnic(String? user_cnic) {
//     ''.val('user_cnic', getBox: preferences).val = user_cnic ?? '';
//   }

//   String get_user_cnic() {
//     return ''.val('user_cnic', getBox: preferences).val;
//   }

//   void set_user_designation(String? user_designation) {
//     ''.val('user_designation', getBox: preferences).val =
//         user_designation ?? '';
//   }


//  String get_user_image() {
//     return ''.val('image', getBox: preferences).val;
//   }

//   void set_user_image(String? user_image) {
//     ''.val('image', getBox: preferences).val =
//         user_image ?? '';
//   }
  
//   String get_user_designation() {
//     return ''.val('user_designation', getBox: preferences).val;
//   }

//   void setUserCurrentAddressId(int? userCurrentAddressId) {
//     0.val('user_current_address_id', getBox: preferences).val =
//         userCurrentAddressId ?? 0;
//   }

//   int getUserCurrentAddressId() {
//     return 0.val('user_current_address_id', getBox: preferences).val;
//   }

//   void setUserLastAddressId(int? userLastAddressId) {
//     0.val('user_last_address_id', getBox: preferences).val =
//         userLastAddressId ?? 0;
//   }

//   int getUserLastAddressId() {
//     return 0.val('user_last_address_id', getBox: preferences).val;
//   }

//   String getUserCurrentLocationLatitude() {
//     return ''.val('user_current_location_latitude', getBox: preferences).val;
//   }

//   void setUserCurrentLocationLatitude(String? userCurrentLocation) {
//     ''.val('user_current_location_latitude', getBox: preferences).val =
//         userCurrentLocation ?? '';
//   }

//   String getUserCurrentLocationLongitude() {
//     return ''.val('user_current_location_longitude', getBox: preferences).val;
//   }

//   void setUserCurrentLocationLongitude(String? userCurrentLocation) {
//     ''.val('user_current_location_longitude', getBox: preferences).val =
//         userCurrentLocation ?? '';
//   }

//   void setUserOldLocation(String? userCurrentLocation) {
//     ''.val('user_Old_location', getBox: preferences).val =
//         userCurrentLocation ?? '';
//   }

//   String getUserOldLocation() {
//     return ''.val('user_Old_location', getBox: preferences).val;
//   }

//   String getUserOldLocationLatitude() {
//     return ''.val('user_Old_location_latitude', getBox: preferences).val;
//   }

//   void setUserOldLocationLatitude(String? userCurrentLocation) {
//     ''.val('user_Old_location_latitude', getBox: preferences).val =
//         userCurrentLocation ?? '';
//   }

//   String getUserOldLocationLongitude() {
//     return ''.val('user_Old_location_longitude', getBox: preferences).val;
//   }

//   void setUserOldLocationLongitude(String? userCurrentLocation) {
//     ''.val('user_Old_location_longitude', getBox: preferences).val =
//         userCurrentLocation ?? '';
//   }

//   void setDistributorName(String? outletAddress) {
//     ''.val('distributor_name', getBox: preferences).val = outletAddress ?? '';
//   }

//   String getDistributorName() {
//     return ''.val('distributor_name', getBox: preferences).val;
//   }


//   void setname(String? name) {
//     ''.val('name', getBox: preferences).val = name ?? '';
//   }

//   String getname() {
//     return ''.val('name', getBox: preferences).val;
//   }






//   void set_store_distributor_id(int? user_id) {
//     0.val('store_distributor_id', getBox: preferences).val = user_id ?? 0;
//   }

//   int get_store_distributor_id() {
//     return 0.val('store_distributor_id', getBox: preferences).val;
//   }

//   void set_user_cafe_id(int? user_id) {
//     0.val('user_cafe_id', getBox: preferences).val = user_id ?? 0;
//   }

//   int get_user_cafe_id() {
//     return 0.val('user_cafe_id', getBox: preferences).val;
//   }

//   void set_user_company_id(String? user_id) {
//     ''.val('user_company_id', getBox: preferences).val = user_id ?? '';
//   }

//   String get_user_company_id() {
//     return ''.val('user_company_id', getBox: preferences).val;
//   }

//   void set_store_distributor_deliveryCharges(int? user_id) {
//     0.val('store_distributor_deliveryCharges', getBox: preferences).val =
//         user_id ?? 0;
//   }

//   int get_store_distributor_deliveryCharges() {
//     return 0.val('store_distributor_deliveryCharges', getBox: preferences).val;
//   }

//   void set_login_code(String? login_code) {
//     ''.val('login_code', getBox: preferences).val =
//         login_code ?? '';
//   }

//   String get_login_code() {
//     return ''.val('login_code', getBox: preferences).val;
//   }

//   void logout() {
//     preferences().erase();
//   }
// }





import 'dart:core';

import 'package:get_storage/get_storage.dart';

class MySharedPrefrence {
  final GetStorage preferences = GetStorage();

  bool getUserLoginStatus() {
    return preferences.read('user_login_status') ?? false;
  }

  void setUserLoginStatus(bool? loginStatus) {
    preferences.write('user_login_status', loginStatus ?? false);
  }

  String getCatId() {
    return preferences.read('cat_id') ?? '';
  }

  void setCatId(String? catId) {
    preferences.write('cat_id', catId ?? '');
  }

  String getVersionCode() {
    return preferences.read('version_code') ?? '';
  }

  void setVersionCode(String? versionCode) {
    preferences.write('version_code', versionCode ?? '');
  }

  String getUserToken() {
    return preferences.read('user_token') ?? '';
  }

  void setUserToken(String? userToken) {
    preferences.write('user_token', userToken ?? '');
  }

  String getUserStatus1() {
    return preferences.read('status1') ?? '0';
  }

  void setUserStatus1(String? userStatus) {
    preferences.write('status1', userStatus ?? '0');
  }

  String getShopName() {
    return preferences.read('shop_name') ?? '';
  }

  void setShopName(String? shopName) {
    preferences.write('shop_name', shopName ?? '');
  }

  String get_user_email() {
    return preferences.read('user_email') ?? '';
  }

  void set_user_email(String? userEmail) {
    preferences.write('user_email', userEmail ?? '');
  }

  String getUserNumber() {
    return preferences.read('user_number') ?? '';
  }

  void setUserNumber(String? userNumber) {
    preferences.write('user_number', userNumber ?? '');
  }

  int get_user_id() {
    return int.tryParse(preferences.read('user_id') ?? '0') ?? 0;
  }

  void set_user_id(int userId) {
    preferences.write('user_id', userId.toString());
  }

  String getUserType() {
    return preferences.read('user_type') ?? '';
  }

  void setUserType(String? userType) {
    preferences.write('user_type', userType ?? '');
  }

  String getDeviceToken() {
    return preferences.read('device_token') ?? '';
  }

  void setDeviceToken(String? deviceToken) {
    preferences.write('device_token', deviceToken ?? '');
  }

  String getVersionName() {
    return preferences.read('versionName') ?? '';
  }

  void setUserCurrentLocation(String? userCurrentLocation) {
    preferences.write('user_current_location', userCurrentLocation ?? '');
  }

  String getUserCurrentLocation() {
    return preferences.read('user_current_location') ?? '';
  }

  void set_user_name(String? userName) {
    preferences.write('user_name', userName ?? '');
  }

  String get_user_name() {
    return preferences.read('user_name') ?? '';
  }

  void setUserCnic(String? userCnic) {
    preferences.write('user_cnic', userCnic ?? '');
  }

  String getUserCnic() {
    return preferences.read('user_cnic') ?? '';
  }

  void setUserDesignation(String? userDesignation) {
    preferences.write('user_designation', userDesignation ?? '');
  }

  String getUserDesignation() {
    return preferences.read('user_designation') ?? '';
  }

  String getUserImage() {
    return preferences.read('image') ?? '';
  }

  void setUserImage(String? userImage) {
    preferences.write('image', userImage ?? '');
  }

  int getUserCurrentAddressId() {
    return preferences.read('user_current_address_id') ?? 0;
  }

  void setUserCurrentAddressId(int? userCurrentAddressId) {
    preferences.write('user_current_address_id', userCurrentAddressId ?? 0);
  }

  int getUserLastAddressId() {
    return preferences.read('user_last_address_id') ?? 0;
  }

  void setUserLastAddressId(int? userLastAddressId) {
    preferences.write('user_last_address_id', userLastAddressId ?? 0);
  }

  String getUserCurrentLocationLatitude() {
    return preferences.read('user_current_location_latitude') ?? '';
  }

  void setUserCurrentLocationLatitude(String? latitude) {
    preferences.write('user_current_location_latitude', latitude ?? '');
  }

  String getUserCurrentLocationLongitude() {
    return preferences.read('user_current_location_longitude') ?? '';
  }

  void setUserCurrentLocationLongitude(String? longitude) {
    preferences.write('user_current_location_longitude', longitude ?? '');
  }

  void setDistributorName(String? distributorName) {
    preferences.write('distributor_name', distributorName ?? '');
  }

  String getDistributorName() {
    return preferences.read('distributor_name') ?? '';
  }

  void setStoreDistributorId(int? distributorId) {
    preferences.write('store_distributor_id', distributorId ?? 0);
  }

  int getStoreDistributorId() {
    return preferences.read('store_distributor_id') ?? 0;
  }

  void setUserCafeId(int? cafeId) {
    preferences.write('user_cafe_id', cafeId ?? 0);
  }

  int getUserCafeId() {
    return preferences.read('user_cafe_id') ?? 0;
  }

  void setUserCompanyId(String? companyId) {
    preferences.write('user_company_id', companyId ?? '');
  }

  String getUserCompanyId() {
    return preferences.read('user_company_id') ?? '';
  }

  void logout() {
    preferences.erase();
  }
}