# Building Blocks Back End

Building Blocks backend is the last project for CraftAcademy Cohort (Feb-April 2017). This is the back end of the app for housing societies that will accept help message request from tenants, send work request to janitors, receive booking of facilities and manage users account (tenant, admin and janitor).

<br>
<img src = "https://github.com/jocontreras/building_blocks_back_end/blob/update_readme/app/assets/images/logo4.png" />
<br>

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for deployment and testing purposes.  See deployment for notes on how to deploy the project on a live system.


In order to organize the features needed for our project and track our progress, we used different tools such as:

**Pivotal Tracker**
[Pivotal Tracker for Building blocks](https://www.pivotaltracker.com/n/projects/2007795).

**GitHub**
This site base reside on [GitHub Pages](https://github.com/CraftAcademy/building_blocks_back_end).

### Installing
Install the pg driver:
```
gem install pg
```
On OS X with Homebrew:
```
gem install pg -- --with-pg-config=/usr/local/bin/pg_config
```
On OS X with MacPorts:
```
gem install pg -- --with-pg-config=/opt/local/lib/postgresql84/bin/pg_config
```
On Windows:
```
gem install pg
```
Choose the win32 build.
Install PostgreSQL and put its /bin directory on your path.

Configure Using Gemfile
```
 gem 'pg'
 ```
### Scaffold Ruby on Rails
If you don't have Rails installed beforehand, it is time to install it now. Rails is a ruby gem, so you can install it as any other gem:
```
$ gem install rails
```
Once you are done it is time to scaffold the Rails application we will be working with.
```
$ rails new building_blocks_back_end --database=postgresql --skip-test --skip-bundle
```
## Built with
* Ruby on Rails
* Cucumber
* RSpec

## Running the test

### Log in
In order to manage the app, the administrator can login the  Building Blocks Back End using the login form:
<br>
<img src = "https://github.com/jocontreras/building_blocks_back_end/blob/update_readme/app/assets/images/admin_login.png" />
<br>

### Home Page
Once the administrator is logged in, he can see the Home Page, you can see the Urgent Help Requests, Latest News and Work Order Status
<br>
<img src = "https://github.com/jocontreras/building_blocks_back_end/blob/update_readme/app/assets/images/home.png" />
<br>

### Help Request Messages
The administrator can view the Help Request Messages sent by tenants:
<br>
<img src = "https://github.com/jocontreras/building_blocks_back_end/blob/update_readme/app/assets/images/help_request.png" />
<br>

### Facilities
This form is being used to create and update information of facilities.
<br>
<img src = "https://github.com/jocontreras/building_blocks_back_end/blob/update_readme/app/assets/images/facilities.png" />
<br>

### News
This form is being used to create and update news.
<br>
<img src = "https://github.com/jocontreras/building_blocks_back_end/blob/update_readme/app/assets/images/news.png" />
<br>

### Send Work Order
This form is being used to send work order to the janitor.
<br>
<img src = "https://github.com/jocontreras/building_blocks_back_end/blob/update_readme/app/assets/images/send_work_order.png" />
<br>


## Deployment
* [Heroku](https://building-blockz.herokuapp.com/) - to deploy, manage, and scale modern apps
* [Semaphore](https://semaphoreci.com/craftacademy/building_blocks_back_end) - for  continuous integration

## Authors
**Casper Jureskog** - https://github.com/casperjureskog <br>
**Fabian Lundgren** - https://github.com/fabianlundgren<br>
**Felix Fottander** - https://github.com/fottander<br>
**Jennifer Contreras** - https://github.com/jocontreras<br>
**Johan Schantz** - https://github.com/Scharrre97<br>

## Acknowledgments

Special thanks to our dear coaches:
* Amber Wilkie
* Thomas Ochman
* Raoul Diffou
* Sigu Magwa
