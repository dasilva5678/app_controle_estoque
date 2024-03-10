// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:app_controle_estoque/core/utils/app_colors.dart';
import 'package:app_controle_estoque/widgets/custom_divider.dart';

class DataStockWidget extends StatelessWidget {
  final String status;
  final String data;
  final String unit;

  const DataStockWidget({
    Key? key,
    required this.status,
    required this.data,
    required this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Color.fromARGB(255, 236, 235, 235),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 7,
                        child: Text(
                          'STATUS',
                          style: TextStyle(
                            color: AppColors.blue,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Text(
                          'DATA',
                          style: TextStyle(
                            color: AppColors.blue,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          'UNIDADE',
                          style: TextStyle(
                            color: AppColors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomDivider(color: AppColors.blue),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 7,
                        child: Text(
                          status,
                          style: TextStyle(
                            color: AppColors.darkBlue,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Text(
                          data,
                          style: TextStyle(
                            color: AppColors.darkBlue,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          unit,
                          style: TextStyle(
                            color: AppColors.darkBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
