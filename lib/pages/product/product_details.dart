import 'package:esilv_dart/pages/product/product_details_bloc.dart';
import 'package:esilv_dart/pages/product/tabs/product_tab0.dart';
import 'package:esilv_dart/pages/product/tabs/product_tab1.dart';
import 'package:esilv_dart/pages/product/tabs/product_tab2.dart';
import 'package:esilv_dart/pages/product/tabs/product_tab3.dart';
import 'package:esilv_dart/res/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
      create: (_) => ProductBloc(),
      child: BlocBuilder<ProductBloc, ProductBlocState>(
        builder: (BuildContext context, ProductBlocState state) {
          if (state.product == null) {
            return const _ProductDetailsLoading();
          } else {
            return const _ProductDetailsLoaded();
          }
        },
      ),
    );
  }
}

class _ProductDetailsLoading extends StatelessWidget {
  const _ProductDetailsLoading();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class _ProductDetailsLoaded extends StatefulWidget {
  const _ProductDetailsLoaded();

  @override
  State<_ProductDetailsLoaded> createState() => _ProductDetailsLoadedState();
}

class _ProductDetailsLoadedState extends State<_ProductDetailsLoaded> {
  ProductDetailsCurrentTab tab = ProductDetailsCurrentTab.summary;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: tab != ProductDetailsCurrentTab.summary,
            child: ProductPageTab0(),
          ),
          Offstage(
            offstage: tab != ProductDetailsCurrentTab.info,
            child: ProductPageTab1(),
          ),
          Offstage(
            offstage: tab != ProductDetailsCurrentTab.nutrition,
            child: ProductPageTab2(),
          ),
          Offstage(
            offstage: tab != ProductDetailsCurrentTab.nutritionalValues,
            child: ProductPageTab3(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tab.index,
        onTap: (int position) {
          tab = ProductDetailsCurrentTab.values[position];
          setState(() {});
        },
        items: ProductDetailsCurrentTab.values
            .map(
              (tab) => BottomNavigationBarItem(
                icon: switch (tab) {
                  ProductDetailsCurrentTab.summary =>
                    Icon(AppIcons.tab_barcode),
                  ProductDetailsCurrentTab.info => Icon(AppIcons.tab_fridge),
                  ProductDetailsCurrentTab.nutrition =>
                    Icon(AppIcons.tab_nutrition),
                  ProductDetailsCurrentTab.nutritionalValues =>
                    Icon(AppIcons.tab_array),
                },
                label: switch (tab) {
                  ProductDetailsCurrentTab.summary => 'Fiche',
                  ProductDetailsCurrentTab.info => 'Caractéristiques',
                  ProductDetailsCurrentTab.nutrition => 'Nutrition',
                  ProductDetailsCurrentTab.nutritionalValues => 'Tableau',
                },
              ),
            )
            .toList(growable: false),
      ),
    );
  }
}

enum ProductDetailsCurrentTab {
  summary,
  info,
  nutrition,
  nutritionalValues,
}
