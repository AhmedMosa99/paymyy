import 'package:flutter/material.dart';import 'package:flutter_screenutil/flutter_screenutil.dart';import 'package:get/get.dart';class AcceptRequest extends StatelessWidget {  String img;  String title;  AcceptRequest({required this.img, required this.title});  @override  Widget build(BuildContext context) {    return Container(      padding: const EdgeInsets.all(21),      height: 230.h,      decoration: BoxDecoration(          color: Colors.white,          border: Border.all(color: Colors.white),          borderRadius: const BorderRadius.only(              topLeft: Radius.circular(30), topRight: Radius.circular(30))),      child: Column(        children: [          Row(            mainAxisAlignment: MainAxisAlignment.end,            children: [              IconButton(                onPressed: () {                  Get.back();                },                icon: const Icon(                  Icons.cancel,                  color: Color(0xffC6C6C6),                  size: 22,                ),              )            ],          ),          Center(            child: Column(              children: [                Image.asset(                  img,                  width: 62.w,                  height: 62.h,                  fit: BoxFit.fill,                ),                SizedBox(                  height: 18.h,                ),                Text(                  title.tr,                  style: Theme.of(context)                      .textTheme                      .bodyText2!                      .copyWith(fontWeight: FontWeight.w600),                ),              ],            ),          )        ],      ),    );  }}