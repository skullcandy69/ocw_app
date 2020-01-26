import 'package:http/http.dart' as http;
import 'package:ocw_app/models/post/post.dart';
import 'package:ocw_app/serializers/serializers.dart';
import 'package:ocw_app/utils/globals.dart';

Future<Null> specificNotification({String amount, String id}) async {
  Map<String, String> body = {
    'message': 'you have recieved \$ $amount amount ',
    'user_id': id,
  };
  await http.post('$url/specific-one-signal.php', body: body);
  return null;
}


Future<Null> createPostNotification({Post post}) async {
  Map<String, String> body = {
    'message':
    '${post.name} have posted a booking of amount ${post.viewAmount}',
    'data': serializers.serialize(post).toString()
  };
  http.Response response = await http.post('$url/one-signal.php', body: body);
  print('er ${response.body}');
}