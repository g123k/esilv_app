import 'package:esilv_dart/res/app_colors.dart';
import 'package:esilv_dart/res/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes scans'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Padding(
              padding: const EdgeInsetsDirectional.only(end: 8.0),
              child: Icon(AppIcons.barcode),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Spacer(flex: 10),
            SvgPicture.asset('res/svg/ill_empty.svg'),
            Spacer(flex: 20),
            Text(
              'Vous n\'avez pas encore scanné de produit',
              textAlign: TextAlign.center,
            ),
            Spacer(flex: 20),
            TextButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.blue,
                backgroundColor: AppColors.yellow,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(22.0))),
              ),
              onPressed: () {
                GoRouter.of(context).push('/details');
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Commencer'.toUpperCase()),
                  SizedBox(width: 10.0),
                  Icon(Icons.arrow_right_alt),
                ],
              ),
            ),
            Spacer(flex: 10),
          ],
        ),
      ),
    );
  }
}
