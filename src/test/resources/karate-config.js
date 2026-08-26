function fn() {
  var config = { // base config JSON
    baseURL : 'https://reqres.in/api/',
  };

  //karate.log('Base URL : ' , config.baseURL);

  // reqres.in can be slow on cold requests / from restricted networks - give it room before failing
  karate.configure('connectTimeout', 15000);
  karate.configure('readTimeout', 15000);
  return config;
}
