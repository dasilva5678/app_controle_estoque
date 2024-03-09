// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_controle_estoque/widgets/custom_divider.dart';
import 'package:flutter/material.dart';

class CustomCardAudit extends StatelessWidget {
  final String date;
  final String unit;
  const CustomCardAudit({
    Key? key,
    required this.date,
    required this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 8, bottom: 8, right: 8, top: 8),
            child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width * 0.02),
                              child: Icon(
                                Icons.circle,
                                size: 8,
                              ),
                            ),
                            const Text(
                              'Status: ',
                            ),
                            Text(
                              '',
                            ),
                          ],
                        ),
                      ],
                    ),
                    CustomDivider(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Cliente: ',
                            ),
                            SizedBox(width: 30),
                            Expanded(
                              flex: 5,
                              child: Text(
                                '',
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Endereço: ",
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                flex: 5,
                                child: Text(
                                  '',
                                ),
                              ),
                            ]),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Text(
                              'Pedido: ',
                            ),
                            SizedBox(width: 30),
                            Text(
                              '',
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
