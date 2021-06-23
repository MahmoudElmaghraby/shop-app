import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/components/components.dart';
import 'package:shop_app/components/constants.dart';
import 'package:shop_app/layout/cubit/states.dart';
import 'package:shop_app/models/home_model.dart';
import 'package:shop_app/modules/categories/categories_screen.dart';
import 'package:shop_app/modules/favorites/favorite_screen.dart';
import 'package:shop_app/modules/products/products_screen.dart';
import 'package:shop_app/modules/settings/settings_screen.dart';
import 'package:shop_app/network/end_points.dart';
import 'package:shop_app/network/remote/dio_helper.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  HomeModel homeModel;

  void getHomeData() {
    emit(ShopLoadingHomeDataState());
    DioHelper.getData(
      url: HOME,
      token: token,
    ).then(
      (value) {
        homeModel = HomeModel.fromJson(value.data);
        printFullText(homeModel.toString());
        emit(ShopSuccessHomeDataState());
      },
    ).catchError(
      (error) {
        emit(ShopErrorHomeDataState());
      },
    );
  }
}
