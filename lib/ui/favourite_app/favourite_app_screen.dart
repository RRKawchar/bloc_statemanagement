import 'package:bloc_practice/bloc/favourite_app/favourite_bloc.dart';
import 'package:bloc_practice/bloc/favourite_app/favourite_event.dart';
import 'package:bloc_practice/bloc/favourite_app/favourite_item_states.dart';
import 'package:bloc_practice/model/favourite_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteAppScreen extends StatefulWidget {
  const FavouriteAppScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteAppScreen> createState() => _FavouriteAppScreenState();
}

class _FavouriteAppScreenState extends State<FavouriteAppScreen> {
  @override
  void initState() {
    super.initState();

    context.read<FavouriteBloc>().add(FetchFavouriteList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite App"),
        actions: [
          BlocBuilder<FavouriteBloc, FavouriteItemStates>(
            builder: (context, state) {
              return Visibility(
                visible: state.tempFavouriteItemModel.isNotEmpty?true:false,
                child: IconButton(onPressed: () {
                  context.read<FavouriteBloc>().add(DeleteItem());
                }, icon: const Icon(Icons.delete, color: Colors.red,)),
              );
            },
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocBuilder<FavouriteBloc, FavouriteItemStates>(
          builder: (context, states) {
            switch (states.listStatus) {
              case ListStatus.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case ListStatus.failure:
                return const Center(
                  child: Text("Something went wrong"),
                );

              case ListStatus.success:
                return ListView.builder(
                    itemCount: states.favouriteItemModel.length,
                    itemBuilder: (context, index) {
                      final item = states.favouriteItemModel[index];

                      return Card(
                        child: ListTile(
                            leading: Checkbox(
                              value: states.tempFavouriteItemModel.contains(
                                  item) ? true : false,
                              onChanged: (value) {
                                if (value!) {
                                  context.read<FavouriteBloc>().add(
                                      SelectedItem(item: item));
                                } else {
                                  context.read<FavouriteBloc>().add(
                                      UnselectedItem(item: item));
                                }
                              },
                            ),
                            title: Text(item.value.toString()),
                            trailing: IconButton(
                              onPressed: () {
                                FavouriteItemModel favouriteItemModel =
                                FavouriteItemModel(
                                  id: item.id,
                                  value: item.value,
                                  isFavourite: item.isFavourite ? false : true,
                                );
                                context.read<FavouriteBloc>().add(
                                    FavouriteItem(item: favouriteItemModel));
                              },
                              icon: Icon(
                                item.isFavourite
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                              ),
                            )),
                      );
                    });
            }
          },
        ),
      ),
    );
  }
}
