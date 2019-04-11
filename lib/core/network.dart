import 'dart:convert';
import 'dart:io';

///简单封装了一个用来获取网络数据的类
///author:liuhc
class NetWork {
  NetWork._();

  static Future<String> query() async {
    var httpClient = HttpClient();
    //打开Http连接
    HttpClientRequest request = await httpClient.getUrl(Uri.parse("https://api.caiyunapp.com/v2/TAkhjf8d1nlSlspN/121.6544,25.1552/realtime.json"));
    //使用iPhone的UA
    request.headers.add("user-agent",
        "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1");
    //等待连接服务器（会将请求信息发送给服务器）
    HttpClientResponse response = await request.close();
    //读取响应内容
    String text = await response.transform(utf8.decoder).join();
    //输出响应头
    print(response.headers);
    //关闭client后，通过该client发起的所有请求都会中止。
    httpClient.close();
    return text;
  }
}
