import 'package:bloc/bloc.dart';
import 'package:bloc_practice/bloc/favourite_app/favourite_event.dart';
import 'package:bloc_practice/bloc/favourite_app/favourite_item_states.dart';
import 'package:bloc_practice/model/favourite_item_model.dart';
import 'package:bloc_practice/repository/favourite_repository.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteItemStates> {
  List<FavouriteItemModel> favouriteList = [];
  List<FavouriteItemModel> tempFavouriteList = [];

  FavouriteRepository repository;
  FavouriteBloc(this.repository) : super(const FavouriteItemStates()) {
    on<FetchFavouriteList>(_fetchData);
    on<FavouriteItem>(_addToFavourite);
    on<SelectedItem>(_selectedItem);
    on<UnselectedItem>(_unSelectedItem);
    on<DeleteItem>(_deleteItem);
  }

  void _fetchData(FetchFavouriteList even, Emitter<FavouriteItemStates> emit) async {
    favouriteList = await repository.fetchItem();
    emit(state.copyWith(
        favouriteItemModel: List.from(favouriteList),
        listStatus: ListStatus.success,
    ),);
  }


  void _addToFavourite(FavouriteItem event, Emitter<FavouriteItemStates> emit) async {
   final index= favouriteList.indexWhere((element) => element.id==event.item.id);

   if(event.item.isFavourite){
     if(tempFavouriteList.contains(favouriteList[index])){
       tempFavouriteList.remove(favouriteList[index]);
       tempFavouriteList.add(event.item);
     }
   }else{
      if(tempFavouriteList.contains(favouriteList[index])){
        tempFavouriteList.remove(favouriteList[index]);
        tempFavouriteList.add(event.item);
      }
   }
   favouriteList[index]=event.item;
   emit(state.copyWith(favouriteItemModel: List.from(favouriteList),tempFavouriteItemModel: List.from(tempFavouriteList)));
  }

  void _selectedItem(SelectedItem event, Emitter<FavouriteItemStates> emit) async {
    tempFavouriteList.add(event.item);
    emit(state.copyWith(tempFavouriteItemModel: List.from(tempFavouriteList)));
  }

  void _unSelectedItem(UnselectedItem event, Emitter<FavouriteItemStates> emit) async {
    tempFavouriteList.remove(event.item);

    emit(state.copyWith(tempFavouriteItemModel: List.from(tempFavouriteList)));
  }

  void _deleteItem(DeleteItem event, Emitter<FavouriteItemStates> emit) async {
  for(int i=0; i< tempFavouriteList.length;i++){
    favouriteList.remove(tempFavouriteList[i]);
  }
  tempFavouriteList.cast();

    emit(state.copyWith(

        favouriteItemModel: List.from(favouriteList),
        tempFavouriteItemModel: List.from(tempFavouriteList)));
  }

}
