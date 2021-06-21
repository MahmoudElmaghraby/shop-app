import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/states.dart';

class NewsCubit extends Cubit<ShopStates> {
  NewsCubit() : super(ShopInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

}
