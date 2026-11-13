function fn() {
  var mockPort = karate.properties['karate.mock.port'] || java.lang.System.getenv('KARATE_MOCK_PORT');
  var baseURL = mockPort
    ? 'http://localhost:' + mockPort + '/api/'
    : 'https://reqres.in/api/';

  karate.log('Base URL:', baseURL);

  karate.configure('connectTimeout', 15000);
  karate.configure('readTimeout', 15000);

  return { baseURL: baseURL };
}
