class TransactionsResponseModel {
  int? status;
  List<CustomerReward>? customerReward;

  TransactionsResponseModel({this.status, this.customerReward});

  TransactionsResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['customer_reward'] != null) {
      customerReward = <CustomerReward>[];
      json['customer_reward'].forEach((v) {
        customerReward!.add(CustomerReward.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (customerReward != null) {
      data['customer_reward'] = customerReward!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomerReward {
  int? transactionid;
  String? transdate;
  String? transtime;
  int? customerid;
  int? cashierid;
  String? transactiontype;
  String? saleamount;
  int? salebonuspoints;
  int? rewardid;
  int? rewardpointsused;
  int? newbalance;
  String? transactionTitle;

  CustomerReward({
    this.transactionid,
    this.transdate,
    this.transactionTitle,
    this.transtime,
    this.customerid,
    this.cashierid,
    this.transactiontype,
    this.saleamount,
    this.salebonuspoints,
    this.rewardid,
    this.rewardpointsused,
    this.newbalance,
  });

  CustomerReward.fromJson(Map<String, dynamic> json) {
    transactionid = json['transactionid'];
    transdate = json['transdate'];
    transtime = json['transtime'];
    customerid = json['customerid'];
    cashierid = json['cashierid'];
    transactiontype = json['transactiontype'];
    saleamount = json['saleamount'];
    salebonuspoints = json['salebonuspoints'];
    rewardid = json['rewardid'];
    rewardpointsused = json['rewardpointsused'];
    newbalance = json['newbalance'];
    transactionTitle = json['transaction_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['transactionid'] = transactionid;
    data['transdate'] = transdate;
    data['transtime'] = transtime;
    data['customerid'] = customerid;
    data['cashierid'] = cashierid;
    data['transactiontype'] = transactiontype;
    data['saleamount'] = saleamount;
    data['salebonuspoints'] = salebonuspoints;
    data['rewardid'] = rewardid;
    data['rewardpointsused'] = rewardpointsused;
    data['newbalance'] = newbalance;
    data['transaction_title'] = transactionTitle;
    return data;
  }
}
