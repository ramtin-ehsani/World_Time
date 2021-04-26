Future<Stream<int>> getCartCount() async {
  User _user = user.value;
  if (_user.apiToken == null) {
    return new Stream.value(0);
  }
  final String _apiToken = 'api_token=${_user.apiToken}&';
  final String url =
      '${GlobalConfiguration().getString('api_base_url')}carts/count?${_apiToken}search=user_id:${_user.id}&search=user_id:=';

  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', Uri.parse(url)));

  return streamedRest.stream.transform(utf8.decoder).transform(json.decoder).map(
    (data) => Helper.getIntData(data),
  );
}