import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsCategoriesTab extends StatelessWidget {
  const ProductsCategoriesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 3,
      separatorBuilder: (_, index) => SizedBox(
        height: 15.h,
      ),
      itemBuilder: (_, index) => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        elevation: 3,
        child: const ListTile(
          title: Text('كهربائية'),
        ),
      ),
    );
  }
}
