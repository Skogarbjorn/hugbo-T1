# ROUTES todo!

## Users
- [ ] GET your profile
- [ ] POST (register)
- [ ] POST (login)
- [ ] PATCH
- [ ] DELETE

## Companies
- [ ] GET by user_company_contracts (to be shown on dashboard - includes basic contract info like role)
- [ ] POST
- [ ] PATCH
- [ ] DELETE (deactivate - thinking soft deletion...)

## Locations
- [ ] GET all by company
- [ ] POST
- [ ] PATCH
- [ ] DELETE

## User_company_contracts
- [ ] GET all for current user (ties in to GET companies)
- [ ] POST
- [ ] PATCH
- [ ] DELETE

## Tasks
- [ ] GET all by company
- [ ] GET by location
- [ ] GET by active  (maybe consolidate all into parameterized query?)
- [ ] POST
- [ ] PATCH
- [ ] PATCH finish
- [ ] PATCH toggle active
- [ ] DELETE (ig?)

## Shifts and all that
- [ ] POST clock in
- [ ] POST clock out
- [ ] POST change location
- [ ] POST change task
- [ ] POST start break
- [ ] POST end break
- [ ] GET current shift
- [ ] GET history of shift for user
- [ ] GET all shifts
- [ ] GET by location
- [ ] GET by employee
- [ ] GET by time frame (maybe consolidate into parameterized query or something idk?)

## Shift requests
- [ ] POST new request
- [ ] GET requests by filter
- [ ] POST review request (approve / dismiss whatever)

i think thats the gist of it, there will be more specialized routes for manager dashboard and stuff but thats later, add if any more come to mind

# other shit to do

attach audit to all tables, look at fucking java spring documentation fuckthisshit

# ENDPOINTS

* /users
- [ ] GET all

* /users/register
- [ ] POST

* /users/login
- [ ] POST

* /users?id
- [ ] GET PATCH DELETE

* /companies
- [ ] GET
- [ ] POST

* /companies?id
- [ ] GET
- [ ] PATCH
- [ ] DELETE

* /locations
- [ ] GET
- [ ] POST

* /locations?params
- [ ] GET company

* /locations?id
- [ ] GET
- [ ] PATCH
- [ ] DELETE

* /registrations
- [ ] GET

* /registrations?id
- [ ] GET
- [ ] PATCH
- [ ] DELETE

* /registrations?user_id
- [ ] GET

* /tasks
- [ ] GET
- [ ] POST

* /tasks?id
- [ ] GET
- [ ] PATCH
- [ ] DELETE

* /tasks?params
- [ ] GET

* /shifts
- [ ] GET
- [ ] POST

* /shifts?id
- [ ] GET
- [ ] PATCH
- [ ] DELETE

* /shifts?id/breaks
- [ ] GET
- [ ] POST

* /shifts?id/breaks?id
- [ ] GET
- [ ] PATCH

* /shifts?id/breaks?params
- [ ] GET

* /shifts?id/tasks
- [ ] GET
- [ ] POST

* /shifts?id/tasks?id
- [ ] GET
- [ ] PATCH

* /shifts?id/tasks?params
- [ ] GET

* /shifts?id/locations
- [ ] GET
- [ ] POST

* /shifts?id/locations?id
- [ ] GET
- [ ] PATCH

* /shifts?id/locations?params
- [ ] GET

* /requests
- [ ] GET
- [ ] POST

* /requests?params
- [ ] GET

* /requests?id
- [ ] GET
- [ ] PATCH
- [ ] DELETE


