import 'package:foodix/core/services/auth_services.dart';
import 'package:foodix/core/services/db_services.dart';
import 'package:foodix/core/services/firebase_auth_services.dart';
import 'package:foodix/core/services/firebase_db_services.dart';
import 'package:foodix/core/services/firebase_service.dart';
import 'package:foodix/core/utils/image_picker_helper.dart';
import 'package:foodix/core/utils/my_shared_preferences.dart';
import 'package:foodix/core/utils/roles.dart';
import 'package:foodix/features/add_food/data/repos/add_food_repo_imp.dart';
import 'package:foodix/features/home/data/repos/home/home_repo_imp.dart';
import 'package:foodix/features/home/data/repos/main_seller/main_seller_repo_imp.dart';
import 'package:foodix/features/home/data/repos/profile/profile_repo_imp.dart';
import 'package:foodix/features/login/data/repos/login_repo_imp.dart';
import 'package:foodix/features/my_restaurant/data/repos/my_restaurant_repo_imp.dart';
import 'package:foodix/features/signup/data/repos/signup_repo_imp.dart';
import 'package:foodix/features/verification/data/repos/verificatoin_repo_imp.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

import '../../features/home/data/repos/main_buyer/main_buyer_repo_imp.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<MySharedPreferences>(MySharedPreferences());

  getIt.registerSingleton<FirebaseService>(FirebaseService());

  final firebaseService = getIt<FirebaseService>();

  getIt.registerSingleton<AuthServices>(FirebaseAuthServices(firebaseService));

  getIt.registerSingleton<DBServices>(FirebaseDBServices(firebaseService));

  final authServices = getIt<AuthServices>();
  final dbServices = getIt<DBServices>();

  getIt.registerSingleton<SignupRepositoryImp>(
    SignupRepositoryImp(authServices, dbServices),
  );

  getIt.registerSingleton<VerificationRepositoryImp>(
    VerificationRepositoryImp(authServices),
  );

  getIt.registerSingleton<LoginRepositoryImp>(LoginRepositoryImp(authServices));

  getIt.registerSingleton<HomeRepositoryImp>(HomeRepositoryImp(dbServices));

  getIt.registerSingleton<ProfileRepositoryImp>(
    ProfileRepositoryImp(authServices, dbServices),
  );

  getIt.registerSingleton<MainSellerRepositoryImp>(
    MainSellerRepositoryImp(dbServices),
  );

  getIt.registerSingleton<AddFoodRepositoryImp>(
    AddFoodRepositoryImp(dbServices),
  );

  getIt.registerLazySingleton<ImagePicker>(() => ImagePicker());

  getIt.registerSingleton<ImagePickerHelper>(
    ImagePickerHelper(picker: getIt<ImagePicker>()),
  );

  getIt.registerSingleton<MainBuyerRepoImp>(
    MainBuyerRepoImp(getIt<DBServices>()),
  );

  getIt.registerLazySingleton<Seller>(() => Seller());

  getIt.registerLazySingleton<Buyer>(() => Buyer());

  getIt.registerSingleton<MyRestaurantRepositoryImp>(
    MyRestaurantRepositoryImp(getIt<DBServices>()),
  );
}
