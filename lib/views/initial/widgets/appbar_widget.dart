import 'package:flutter/material.dart';
import 'package:CRONO/core/core.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget()
      : super(
          preferredSize: Size.fromHeight(100),
          child: Container(
            height: 100,
            child: Stack(
              children: [
                Container(
                  height: 100,
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    gradient: AppGradients.linear,
                    //color: AppColors.red,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: Image.asset(
                        AppImages.logo,
                        width: 129,
                        height: 26,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
}
