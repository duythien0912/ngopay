import 'dart:convert';

import 'package:candlesticks/candlesticks.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:candlesticks/candlesticks.dart';

class BinanceRepository {
  Future<List<Candle>> fetchCandles({
    required String symbol,
    required String interval,
    int? endTime,
  }) async {
    final uri = Uri.parse(
      "https://api.binance.com/api/v3/klines?symbol=$symbol&interval=$interval${endTime != null ? "&endTime=$endTime" : ""}",
    );
    final res = await http.get(uri);
    return (jsonDecode(res.body) as List<dynamic>)
        .map((dynamic e) => Candle.fromJson(e as List<dynamic>))
        .toList()
        .reversed
        .toList();
  }

  Future<List<String>> fetchSymbols() async {
    final uri = Uri.parse('https://api.binance.com/api/v3/ticker/price');
    final res = await http.get(uri);
    return (jsonDecode(res.body) as List<dynamic>)
        .map((dynamic e) => e['symbol'] as String)
        .toList();
  }

  WebSocketChannel establishConnection(String symbol, String interval) {
    final channel = WebSocketChannel.connect(
      Uri.parse('wss://stream.binance.com:9443/ws'),
    );
    channel.sink.add(
      jsonEncode(
        {
          'method': 'SUBSCRIBE',
          'params': ['$symbol@kline_$interval'],
          'id': 1
        },
      ),
    );
    return channel;
  }
}

class CandleTickerModel {
  final int eventTime;
  final String symbol;
  final Candle candle;

  const CandleTickerModel(
      {required this.eventTime, required this.symbol, required this.candle});

  factory CandleTickerModel.fromJson(Map<String, dynamic> json) {
    return CandleTickerModel(
        eventTime: json['E'] as int,
        symbol: json['s'] as String,
        candle: Candle(
            date: DateTime.fromMillisecondsSinceEpoch(json["k"]["t"] as int),
            high: double.parse(json["k"]["h"].toString()),
            low: double.parse(json["k"]["l"].toString()),
            open: double.parse(json["k"]["o"].toString()),
            close: double.parse(json["k"]["c"].toString()),
            volume: double.parse(json["k"]["v"].toString())));
  }
}
