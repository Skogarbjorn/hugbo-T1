# ENDPOINTS

* /users
    - [ ] CRUD
* /companies
    - [ ] CRUD
* /locations
- [ ] CRUD
* /contracts
- [ ] CRUD
* /tasks
- [ ] CRUD
* /shifts
- [ ] CRUD
* /shifts/:id/tasks
- [ ] CRUD
* /shifts/:id/locations
- [ ] CRUD
* /shifts/:id/breaks
- [ ] CRUD
* /requests
- [ ] CRUD

* /users/register
- [ ] POST

* /users/login
- [ ] POST

* /users/:id
- [ ] GET
- [ ] PATCH
- [ ] DELETE

* /company/:id
- [ ] GET
- [ ] PATCH
- [ ] DELETE

* /company/:id/locations
- [ ] GET
- [ ] POST

* /company/:id/locations?params
- [ ] GET

* /company/:id/locations/:id
- [ ] GET
- [ ] PATCH
- [ ] DELETE

* /user/:id/contracts
- [ ] GET

* /user/:id/contracts/:id (maybe sus)
- [ ] GET
- [ ] PATCH
- [ ] DELETE

* /company/:id/tasks
- [ ] GET
- [ ] POST

* /company/:id/tasks?params
- [ ] GET

* /company/:id/tasks/:id
- [ ] GET
- [ ] PATCH
- [ ] DELETE

* /company/:id/shifts
- [ ] GET
- [ ] POST

* /company/:id/shifts?params
- [ ] GET

* /company/:id/shifts/:id
- [ ] GET
- [ ] PATCH
- [ ] DELETE

* /company/:id/shifts/:id/breaks
- [ ] GET
- [ ] POST

* /company/:id/shifts/:id/breaks/:id
- [ ] GET
- [ ] PATCH

* /company/:id/shifts/:id/breaks?params
- [ ] GET

* /company/:id/shifts/:id/tasks
- [ ] GET
- [ ] POST

* /company/:id/shifts/:id/tasks/:id
- [ ] GET
- [ ] PATCH

* /company/:id/shifts/:id/tasks?params
- [ ] GET

* /company/:id/shifts/:id/locations
- [ ] GET
- [ ] POST

* /company/:id/shifts/:id/locations/:id
- [ ] GET
- [ ] PATCH

* /company/:id/shifts/:id/locations?params
- [ ] GET

* /company/:id/requests
- [ ] GET
- [ ] POST

* /company/:id/requests?params
- [ ] GET

* /company/:id/requests/:id
- [ ] GET
- [ ] PATCH
- [ ] DELETE

i think thats the gist of it, there will be more specialized routes for manager dashboard and stuff but thats later, add if any more come to mind

# other shit to do

attach audit to all tables, look at fucking java spring documentation fuckthisshit
