Name: Simplelogin 0.1
License: Simplelogin is released to the public domain.
Released: April 25, 2007
CI Version: Tested with CodeIgniter 1.5.3 (should work with previous versions and hopefully future versions)
Author: Anthony Graddy

************************
INTRODUCTION
************************
Simplelogin is designed to give you a quick and simple login library that will get you up and running with an unobtrusive authorization system very quickly. It does not try to guess how you want to structure your app, it simply tries to give you a little help. Feel free to edit it in any way to suit your needs.

It is designed to help if you need it; otherwise, it stays out of your way.


************************
INSTALLATION
************************

To install, just copy Simplelogin.php to your application/libraries directory. You will need to load the database, session, and simplelogin libraries to run it (I recommend just autoloading them).

Simplelogin uses a database. Here is the SQL to create the table in MySQL (feel free to add columns):
####################
CREATE TABLE `users` (
`id` INT( 11 ) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
`username` VARCHAR( 64 ) NOT NULL ,
`password` VARCHAR( 64 ) NOT NULL ,
UNIQUE (
`username`
)
);
####################


************************
METHODS
************************
Simplelogin currently has four methods:
login, logout, create, delete

I debated about putting create and delete in the library. Simplelogin is basically designed to allow users to get up and running quickly with a login system (it is simply designed to help you manage user logins, not write your login forms, not editing users, not remembering your users, etc. - those extras should be handled with Models, Views, and Controllers you setup yourself). Although I think that create and delete should fall in the "do it yourself" category, I figured it would probably be best for new users to see the basic concept (besides, advanced users can just ignore those methods if they want).


************************
CONTROLLER EXAMPLES
************************

example.php and example_obsession_version.php are simply controller examples of how to work with the library (you should never use controllers like this in a real project) - these files are examples and are not necessary. They assume that you are auto loading 'database', 'session', 'simplelogin'.

If you are using the default CodeIgniter sessions, then check out the example.php controller.

I highly recommend Oscar Bajner's OBSession library. If you would like to use that library with Simplelogin, just follow the setup information in Oscar's userguide (mainly the config settings and the database info). You can then use the example_obsession_version.php controller which adds extra functionality (since Oscar's library just adds additional features to the original CodeIgniter library, you can also use the example.php controller with OBSession).


************************
FINAL NOTES
************************
Since Simplelogin is released to the public domain, feel free to use it in any way you want. It is designed to be easily modified to work with your setup (for instance, you may want to add additional columns to your database or you may want to add error messages in the library itself).

Please keep in mind that you are using this library at your own risk. Please direct support issues to the CodeIgniter forums, and I will help if I can (no guarantees).

- Anthony Graddy