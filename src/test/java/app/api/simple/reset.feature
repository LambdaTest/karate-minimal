@local
Feature: helper to clear all todos

Scenario:
  * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:9999')  # wrong port
  * url urlBase
  * path 'api', 'reset'
  * method get
  * status 404  # wrong expected status
  * eval java.lang.Thread.sleep(30000)
