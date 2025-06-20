Feature:

  Scenario:
    * def helper = Java.type('app.api.interop.Helper')
    * def result = helper.doWork('hello world')
    * match result == { "message": "Not hello world1" }
    * eval java.lang.Thread.sleep(30000)
