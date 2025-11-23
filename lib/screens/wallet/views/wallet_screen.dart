import 'package:flutter/material.dart';
import 'package:ecom/constants.dart';
import 'package:ecom/models/product_model.dart';

import 'components/wallet_balance_card.dart';
import 'components/wallet_history_card.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wallet"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                sliver: SliverToBoxAdapter(
                  child: WalletBalanceCard(
                    balance: 384.90,
                    onTabChargeBalance: () {},
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(top: defaultPadding / 2),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    "Wallet history",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                    padding: const EdgeInsets.only(top: defaultPadding),
                    child: WalletHistoryCard(
                      isReturn: index == 1,
                      date: "JUN 12, 2020",
                      amount: 129,
                      products: [
                        ProductModel(
                          variations: [],
                          pId: "",
                          name: "",
                          image: productDemoImg1,
                          highlightHeading: "Mountain Warehouse for Women",
                          brand: "Lipsy london",
                          mrp: 540,
                          priceAfetDiscount: 420,
                          dicountpercent: 20,
                          reviews: [],
                          vendorId: '',
                          vendorName: '',
                          productRatings: null,
                        ),
                        ProductModel(
                          variations: [],
                          pId: "",
                          name: "",
                          image: productDemoImg4,
                          highlightHeading: "Mountain Beta Warehouse",
                          brand: "Lipsy london",
                          mrp: 800,
                          reviews: [],
                          vendorId: '',
                          vendorName: '',
                          productRatings: null,
                        ),
                      ],
                    ),
                  ),
                  childCount: 4,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
