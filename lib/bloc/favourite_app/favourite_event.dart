import 'package:bloc_practice/model/favourite_item_model.dart';
import 'package:equatable/equatable.dart';

abstract class FavouriteEvent extends Equatable{
  const FavouriteEvent();

  @override
  List<Object?> get props => [];

}


class FetchFavouriteList extends FavouriteEvent{}

class FavouriteItem extends FavouriteEvent{
  final FavouriteItemModel item;

  const FavouriteItem({required this.item});


}


class SelectedItem extends FavouriteEvent{
  final FavouriteItemModel item;

  const SelectedItem({required this.item});


}

class UnselectedItem extends FavouriteEvent{
  final FavouriteItemModel item;

  const UnselectedItem({required this.item});


}

class DeleteItem extends FavouriteEvent{}