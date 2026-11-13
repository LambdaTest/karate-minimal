Feature: Local mock backend replacing reqres.in

Background:
  * def users = [{ id: 1, first_name: 'George', last_name: 'Bluth' }, { id: 2, first_name: 'Janet', last_name: 'Weaver' }]

Scenario: pathMatches('/api/users/{id}') && methodIs('get')
  * def id = parseInt(pathParams.id)
  * def found = users.find(function(u){ return u.id == id })
  * def responseStatus = found ? 200 : 404
  * def response = found ? { data: found, support: { url: 'mock' } } : {}

Scenario: pathMatches('/api/users') && methodIs('get')
  * def page = parseInt(paramValue('page') || '1')
  * def responseStatus = 200
  * def response = { page: page, per_page: 6, total: users.length, total_pages: 1, data: users }

Scenario: pathMatches('/api/users') && methodIs('post')
  * def responseStatus = 201
  * def response = { id: '123', createdAt: '2026-11-13T00:00:00.000Z', firstName: request.firstName, lastName: request.lastName, username: request.username }

Scenario: pathMatches('/api/users/{id}') && methodIs('put')
  * def responseStatus = 200
  * def response = { updatedAt: '2026-11-13T00:00:00.000Z', firstName: request.firstName, city: request.city }

Scenario: pathMatches('/api/users/{id}') && methodIs('delete')
  * def responseStatus = 204
  * def response = ''

Scenario: pathMatches('/api/login') && methodIs('post')
  * def hasPassword = request.password != null
  * def responseStatus = hasPassword ? 200 : 400
  * def response = hasPassword ? { token: 'QpwL5tke4Pnpja7X4' } : { error: 'Missing password' }
