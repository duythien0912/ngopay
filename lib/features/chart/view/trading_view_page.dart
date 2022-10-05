import 'package:easy_web_view/easy_web_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const html = '''
<!-- TradingView Widget BEGIN -->
  <div class="tradingview-widget-container">
    <div id="tradingview_087e8"></div>
    <div class="tradingview-widget-copyright"><a href="https://www.tradingview.com/symbols/BTCUSDT/?exchange=BINANCE" rel="noopener" target="_blank"><span class="blue-text">BTCUSDT Chart</span></a> by TradingView</div>
    <script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
    <script type="text/javascript">
      new TradingView.widget(
        {
        "autosize": true,
        "symbol": "BINANCE:BTCUSDT",
        "interval": "D",
        "timezone": "Etc/UTC",
        "theme": "light",
        "style": "1",
        "locale": "en",
        "toolbar_bg": "#f1f3f6",
        "enable_publishing": false,
        "allow_symbol_change": true,
        "container_id": "tradingview_087e8"
        }
      );
    </script>
  </div>
<!-- TradingView Widget END -->
''';

class TradingViewPage extends ConsumerWidget {
  const TradingViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Easy Web View'),
      ),
      body: const EasyWebView(
        src: html,
        key: ValueKey('trading_view_page_easy_web_view'),
      ),
    );
  }
}
