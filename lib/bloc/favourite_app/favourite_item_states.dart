import 'package:bloc_practice/model/favourite_item_model.dart';
import 'package:equatable/equatable.dart';

enum ListStatus { loading, success, failure }

class FavouriteItemStates extends Equatable {
  final List<FavouriteItemModel> favouriteItemModel;
  final List<FavouriteItemModel> tempFavouriteItemModel;


  final ListStatus listStatus;
  const FavouriteItemStates({
    this.favouriteItemModel = const [],
    this.tempFavouriteItemModel = const [],
    this.listStatus=ListStatus.loading,
  });


  FavouriteItemStates copyWith({List<FavouriteItemModel>? favouriteItemModel,List<FavouriteItemModel>? tempFavouriteItemModel, ListStatus? listStatus}){

    return FavouriteItemStates(
       favouriteItemModel: favouriteItemModel?? this.favouriteItemModel,
      tempFavouriteItemModel: tempFavouriteItemModel?? this.tempFavouriteItemModel,
      listStatus: listStatus??this.listStatus,

    );

}

  @override
  List<Object?> get props => [favouriteItemModel,tempFavouriteItemModel,listStatus];
}
