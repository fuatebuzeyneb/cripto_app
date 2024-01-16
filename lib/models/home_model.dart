class HomeModel {
  final String currencySymbolFrom;
  final String currencySymbolTo;
  final String buyLimit;
  final String stopLoss;
  final String profitOne;
  final String profitTwo;
  final String date;
  final String operation;
  final String R;

  HomeModel({
    required this.currencySymbolFrom,
    required this.currencySymbolTo,
    required this.buyLimit,
    required this.stopLoss,
    required this.profitOne,
    required this.profitTwo,
    required this.date,
    required this.R,
    required this.operation,
  });

  factory HomeModel.fromJson(jsonData) {
    return HomeModel(
      currencySymbolFrom: jsonData['currencySymbolFrom'],
      currencySymbolTo: jsonData['currencySymbolTo'],
      buyLimit: jsonData['buyLimit'],
      stopLoss: jsonData['stopLoss'],
      profitOne: jsonData['profitOne'],
      profitTwo: jsonData['profitTwo'],
      R: jsonData['R'],
      date: jsonData['date'],
      operation: jsonData['operation'],
    );
  }
}
