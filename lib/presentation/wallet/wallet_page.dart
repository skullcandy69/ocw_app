import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ocw_app/models/transaction/transaction.dart';
import 'package:ocw_app/models/transaction/transaction_status.dart';
import 'package:ocw_app/models/user/user.dart';
import 'package:ocw_app/presentation/wallet/request_money.dart';
import 'package:ocw_app/presentation/wallet/send_money.dart';
import 'package:ocw_app/utils/size_config.dart';

class Wallet extends StatefulWidget {
  final User user;
  final Function onRequestMoney;
  final Function onSendMoney;
  final Function onRefresh;
  final bool isRefreshing;
  final List<Transaction> transactions;

  Wallet(
      {this.user,
      this.onSendMoney,
      this.onRequestMoney,
      this.onRefresh,
      this.isRefreshing,
      this.transactions});

  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
//        appBar: AppBar(
//          title: Text('Wallet'),
//          backgroundColor: Colors.black,
//        ),
        body: RefreshIndicator(
          notificationPredicate: shouldRefresh,
          child: SingleChildScrollView(
            child: Container(
              height: SizeConfig.screenHeight * 0.89,
              width: SizeConfig.screenWidth,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  walletDetails(),
                  SizedBox(
                    height: 10,
                  ),
                  transactionList(),
                  SizedBox(
                    height: 10,
                  ),
                  bottomCarouselBar(),
                ],
              ),
            ),
          ),
          onRefresh: _handleRefresh,
        ),
      ),
    );
  }

  bool shouldRefresh(ScrollNotification notification) {
    return !widget.isRefreshing;
  }

  Future<Null> _handleRefresh() async {
    if (widget.isRefreshing) {
      await new Future.delayed(new Duration(seconds: 3));
      return null;
    } else {
      widget.onRefresh();
    }
    await new Future.delayed(new Duration(seconds: 3));

    return null;
  }

  Widget walletDetails() {
    return Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            bottomLeft: Radius.circular(20.0),
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          height: SizeConfig.screenHeight * 0.2,
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30), topLeft: Radius.circular(30)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(
                Icons.account_balance,
                size: 24,
                color: Colors.blueAccent,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.user.fullName,
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                      Text(
                        "Available Balance",
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        "₹ ${widget.user.amount}",
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        "Phone Number",
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        widget.user.phoneNumber,
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomCarouselBar() {
    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight * 0.05,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SendMoneyDialog(widget.onSendMoney, widget.user);
                  });
            },
            child: Container(
              height: 50,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.all(Radius.circular(SizeConfig.screenWidth)),
              ),
              child: Center(
                  child: Image.asset(
                'assets/send_money.png',
                fit: BoxFit.contain,
              )),
            ),
          ),
          SizedBox(
            width: SizeConfig.screenWidth * 0.5,
          ),
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return RequestMoneyDialog(widget.onRequestMoney);
                  });
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.all(Radius.circular(SizeConfig.screenWidth)),
              ),
              child: Center(
                  child: Image.asset(
                'assets/add_money_passbook.png',
                fit: BoxFit.contain,
              )),
            ),
          ),
        ],
      ),
    );
  }

  Widget transactionList() {
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TabBar(
              tabs: [
                Tab(text: 'RECENT TRANSACTIONS'),
                Tab(text: 'ALL TRANSACTIONS')
              ],
              labelColor: Colors.blue,
            ),
            Container(
              height: SizeConfig.screenHeight * 0.50,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TabBarView(children: [
                Container(
                  height: SizeConfig.screenHeight * 0.54,
                  child: ListView.builder(
                    itemCount: widget.transactions.length <= 10
                        ? widget.transactions.length
                        : 10,
                    itemBuilder: (BuildContext context, int index) {
                      return TransactionWidget(
                        transaction: widget.transactions[index],
                        user: widget.user,
                      );
                    },
                  ),
                ),
                Container(
                  height: SizeConfig.screenHeight * 0.54,
                  child: ListView.builder(
                    itemCount: widget.transactions.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TransactionWidget(
                        transaction: widget.transactions[index],
                        user: widget.user,
                      );
                    },
                  ),
                ),
              ]),
            )
          ],
        ));
  }
}

class TransactionWidget extends StatelessWidget {
  final Transaction transaction;
  final User user;

  const TransactionWidget({Key key, this.transaction, this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String transactionName;
    IconData transactionIconData;
    Color color;
    switch (transaction.status) {
      case TransactionStatus.success:
        if (transaction.senderId == user.id) {
          transactionName = "Sent";
          transactionIconData = Icons.arrow_upward;
          color = Theme.of(context).primaryColor;
        } else {
          transactionName = "Received";
          transactionIconData = Icons.arrow_downward;
          color = Colors.green;
        }
        break;
      case TransactionStatus.failure:
        transactionName = "Received";
        transactionIconData = Icons.arrow_downward;
        color = Colors.green;
        break;
      case TransactionStatus.pending:
        transactionName = "Pending";
        transactionIconData = Icons.arrow_downward;
        color = Colors.orange;
        break;
    }
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Colors.grey[350],
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl:
                        "http://www.brooklynartscouncil.org/images_sys/layout/default_profile_image.jpg",
                    alignment: Alignment.center,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 15.0,
                    height: 15.0,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                    child: FittedBox(
                      child: Icon(
                        transactionIconData,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(width: 5.0),
          Flexible(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          transaction.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      " ₹${transaction.amount}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "${DateFormat.jms().format(DateTime.parse(transaction.timestamp))}",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    Text(
                      "$transactionName",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                  ],
                ),
                Text(
                  "${DateFormat.yMMMMd().format(DateTime.parse(transaction.timestamp))}",
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
