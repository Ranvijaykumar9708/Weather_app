import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/utils/color_constant.dart';

Widget getBottonWidget({required String title,required Function onPressed}){
  return  Bounce(
                          onTap: (){
                           onPressed();
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: ColorConstant.yelloColor
                            ),
                            alignment: Alignment.center,
                          child:    Text(title,
                          style: TextStyle(
                            color: ColorConstant.blueColor,fontSize: 15,fontWeight: FontWeight.w600
                          ),
                          ),
                          ),
                        );
}