import 'package:flutter/material.dart';
import 'package:truck_delivery_customer/constant/app_colors.dart';
import 'package:truck_delivery_customer/wigets/headline.dart';

import '../utils/api_end_points.dart';
import '../wigets/places_autocomplete_field.dart';

class DeliveryDetail extends StatefulWidget {
  const DeliveryDetail({super.key});

  @override
  State createState() => _MyStatefulWidgetDeliveryDetailState();
}

class _MyStatefulWidgetDeliveryDetailState extends State<DeliveryDetail> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          AppBar(
            backgroundColor: AppColors.appbarBackground,
            leading: BackButton(),
            title: Text('Chi Tiết Đơn Đặt Hàng'),
          ),
          Card(
            margin: EdgeInsets.all(16),
            color: AppColors.white,
            shadowColor: AppColors.black,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 60,
                      child: Icon(
                        Icons.my_location,
                        color: AppColors.primary,
                      ),
                    ),
                    const Flexible(
                        child: PlacesAutocompleteField(
                      apiKey: ApiEndPoints.API_Key,
                      hint: 'Địa Điểm Lấy Hàng',
                      inputDecoration: InputDecoration(
                          filled: true,
                          hintStyle: TextStyle(fontWeight: FontWeight.bold),
                          border: InputBorder.none,
                          fillColor: AppColors.transparent),
                    ))
                  ],
                ),
                Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 60,
                        child: Icon(
                          Icons.arrow_downward,
                          size: 15,
                        ),
                      ),
                    ]),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 60,
                      child: Icon(
                        Icons.location_on,
                        color: AppColors.blueAccent,
                      ),
                    ),
                    Flexible(
                      child: TextFormField(
                        enabled: false,
                        decoration: const InputDecoration(
                            filled: true,
                            hintStyle: TextStyle(fontWeight: FontWeight.bold),
                            hintText: 'Địa Điểm Trả Hàng',
                            border: InputBorder.none,
                            fillColor: AppColors.transparent),
                        onChanged: (value) {
                          // formData.password = value;
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
