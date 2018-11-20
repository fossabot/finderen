# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

    ``2.5.3``

* Prepare your workspace

  ``rake prepare_workstation:development``

* Database creation && initialization

  ``rake db:create && rake db:migrate && rake db:seed``

* Launch the application

  ``foreman start``

* How to run the test suite

  ``rake run_tests:core`` *rspec spec/ -t core*

  ``rake run_tests:non_core`` *rspec spec/ -t non_core*

  ``rake run_tests:all`` *rspec spec/*

* Deployment instructions

  ``cap production deploy``