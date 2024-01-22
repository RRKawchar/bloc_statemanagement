import 'package:bloc_practice/model/favourite_item_model.dart';

class FavouriteRepository{

Future<List<FavouriteItemModel>> fetchItem()async{
    await Future.delayed(const Duration(seconds: 3));
  return List<FavouriteItemModel>.of(_generated(10));

}


List<FavouriteItemModel> _generated(int length){

  return List<FavouriteItemModel>.generate(length, (index){
    return FavouriteItemModel(id: length.toString(), value: 'items $index');
  });
}
}