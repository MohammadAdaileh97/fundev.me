import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fun_dev_project/l10n/app_localizations.dart';
import 'package:fun_dev_project/features/auth/data/data_source/auth_data_source.dart';
import 'package:fun_dev_project/features/auth/data/repository/auth_repository_impl.dart';
import 'package:fun_dev_project/features/auth/domain/use_case/forgot_password_use_case.dart';
import 'package:fun_dev_project/features/auth/domain/use_case/login_use_case.dart';
import 'package:fun_dev_project/features/auth/domain/use_case/signup_use_case.dart';
import 'package:fun_dev_project/features/auth/domain/use_case/update_password_use_case.dart';
import 'package:fun_dev_project/features/auth/presentation/cubit/forgot_password_cubit.dart';
import 'package:fun_dev_project/features/auth/presentation/cubit/login_cubit.dart';
import 'package:fun_dev_project/features/auth/presentation/cubit/signup_cubit.dart';
import 'package:fun_dev_project/features/auth/presentation/cubit/update_password_cubit.dart';
import 'package:fun_dev_project/features/home/data/data_source/home_data_source.dart';
import 'package:fun_dev_project/features/home/data/repository/home_repository_imp.dart';
import 'package:fun_dev_project/features/home/domain/use_case/get_ads_use_case.dart';
import 'package:fun_dev_project/features/home/presentation/cubit/get_ads_cubit.dart';
import 'package:fun_dev_project/features/item/domain/repository/items_repository.dart';
import 'package:fun_dev_project/features/item/domain/use_case/get_items_use_case.dart';
import 'package:fun_dev_project/features/item/presentation/cubit/get_items_cubit.dart';
import 'package:fun_dev_project/features/localization/presentation/cubit/localization_cubit.dart';
import 'package:fun_dev_project/features/profile/presintation/cubit/update_user_profile_cubit.dart';
import 'package:fun_dev_project/features/splash/presentation/screen/splash_screen.dart';

import 'features/auth/domain/repository/auth_repository.dart';
import 'features/fav/data/data_source/fav_data_source.dart';
import 'features/fav/data/repository/fav_repository_impl.dart';
import 'features/fav/domain/repository/fav_repository.dart';
import 'features/fav/domain/use_case/fav_use_case.dart';
import 'features/fav/domain/use_case/get_fav_item_use_case.dart';
import 'features/fav/presentation/cubit/fav_cubit.dart';
import 'features/fav/presentation/cubit/fav_item_cubit.dart';
import 'features/home/domain/repository/home_repository.dart';
import 'features/item/data/data_source/items_remote_data_source.dart';
import 'features/item/data/repository/items_repository_impl.dart';
import 'features/item/domain/use_case/get_color_use_case.dart';
import 'features/item/domain/use_case/get_item_images_use_case.dart';
import 'features/item/domain/use_case/get_related_items_use_case.dart';
import 'features/item/domain/use_case/get_size_use_case.dart';
import 'features/item/presentation/cubit/get_colors_cubit.dart';
import 'features/item/presentation/cubit/get_item_images_cubit.dart';
import 'features/item/presentation/cubit/get_related_items_cubit.dart';
import 'features/item/presentation/cubit/get_size_cubit.dart';
import 'features/profile/data/data_source/profile_data_source.dart';
import 'features/profile/data/repository/profile_repository_impl.dart';
import 'features/profile/domain/repository/profile_repository.dart';
import 'features/profile/domain/use_case/change_password_use_case.dart';
import 'features/profile/domain/use_case/update_user_image_use_case.dart';
import 'features/profile/domain/use_case/update_user_profile_use_case.dart';
import 'features/profile/presintation/cubit/change_password_cubit.dart';
import 'features/profile/presintation/cubit/update_user_image_cubit.dart';
import 'features/shop/data/data_source/category_remote_data_source.dart';
import 'features/shop/data/repository/category_repository_impl.dart';
import 'features/shop/domain/repository/category_repository.dart';
import 'features/shop/domain/use_case/get_category_use_case.dart';
import 'features/shop/presentation/cubit/get_categories_cubit.dart';
import 'features/take_image/cubit/take_images_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AuthRepository authRepository = AuthRepositoryImpl(
    authDataSource: AuthDataSourceImpl(),
  );

  final HomeRepository homeRepository = HomeRepositoryImp(
    dataSource: HomeDataSourceImp(),
  );

  final CategoryRepository categoryRepository = CategoryRepositoryImpl(
    remoteDataSource: CategoryRemoteDataSourceImpl(),
  );
  final ItemsRepository itemsRepository = ItemsRepositoryImpl(
    itemsRemoteDataSource: ItemsRemoteDataSourceImpl(),
  );
  final ProfileRepository profileRepository = ProfileRepositoryImpl(
    profileDataSource: ProfileDataSourceImpl(),
  );

  final FavRepository favRepository = FavRepositoryImpl(
    favDataSource: FavDataSourceImpl(),
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LocalizationCubit()..getLocale()),
        BlocProvider(
          create: (context) {
            return LoginCubit(
              loginUseCase: LoginUseCase(authRepository: authRepository),
            );
          },
        ),
        BlocProvider(
          create: (context) {
            return SignupCubit(
              signupUseCase: SignupUseCase(authRepository: authRepository),
            );
          },
        ),
        BlocProvider(
          create: (context) {
            return ForgotPasswordCubit(
              forgotPasswordUseCase: ForgotPasswordUseCase(
                authRepository: authRepository,
              ),
            );
          },
        ),
        BlocProvider(
          create: (context) {
            return UpdatePasswordCubit(
              forgotPasswordUseCase: UpdatePasswordUseCase(
                authRepository: authRepository,
              ),
            );
          },
        ),

        BlocProvider(
          create: (context) {
            return GetAdsCubit(
              getAdsUseCase: GetAdsUseCase(homeRepository: homeRepository),
            );
          },
        ),
        BlocProvider(
          create: (context) {
            return GetCategoriesCubit(
              getCategoryUseCase: GetCategoryUseCase(
                categoryRepository: categoryRepository,
              ),
            );
          },
        ),
        BlocProvider(
          create: (context) {
            return GetItemsCubit(
              getItemsUseCase: GetItemsUseCase(
                itemsRepository: itemsRepository,
              ),
            );
          },
        ),

        BlocProvider(
          create: (context) {
            return TakeImagesCubit();
          },
        ),

        BlocProvider(
          create: (context) {
            return UpdateUserImageCubit(
              updateUserImageUseCase: UpdateUserImageUseCase(
                profileRepository: profileRepository,
              ),
            );
          },
        ),
        BlocProvider(
          create: (context) {
            return UpdateUserProfileCubit(
              updateUserProfileUseCase: UpdateUserProfileUseCase(
                profileRepository: profileRepository,
              ),
            );
          },
        ),

        BlocProvider(
          create: (context) {
            return ChangePasswordCubit(
              changePasswordUseCase: ChangePasswordUseCase(
                profileRepository: profileRepository,
              ),
            );
          },
        ),
        BlocProvider(
          create: (context) {
            return GetColorsCubit(
              getColorUseCase: GetColorUseCase(
                itemsRepository: itemsRepository,
              ),
            );
          },
        ),
        BlocProvider(
          create: (context) {
            return GetSizeCubit(
              getSizeUseCase: GetSizeUseCase(itemsRepository: itemsRepository),
            );
          },
        ),
        BlocProvider(
          create: (context) {
            return GetRelatedItemsCubit(
              getRelatedItemsUseCase: GetRelatedItemsUseCase(
                itemsRepository: itemsRepository,
              ),
            );
          },
        ),

        BlocProvider(
          create: (context) {
            return GetItemImagesCubit(
              getItemImagesUseCase: GetItemImagesUseCase(
                itemsRepository: itemsRepository,
              ),
            );
          },
        ),
        BlocProvider(
          create: (context) {
            return FavCubit(
              favUseCase: FavUseCase(favRepository: favRepository),
            );
          },
        ),
        BlocProvider(
          create: (context) {
            return FavItemCubit(
              getFavItemUseCase: GetFavItemUseCase(
                favRepository: favRepository,
              ),
            );
          },
        ),
      ],
      child: BlocBuilder<LocalizationCubit, Locale>(
        builder: (context, locale) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [Locale('en'), Locale('ar')],
            title: 'Flutter Demo',
            locale: locale,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
