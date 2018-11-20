# FINDEREN

[![Build Status](https://travis-ci.org/Tivgres/finderen.svg?branch=master)](https://travis-ci.org/Tivgres/finderen)
[![Maintainability](https://api.codeclimate.com/v1/badges/4e1a39205c5ff4562720/maintainability)](https://codeclimate.com/github/Tivgres/finderen/maintainability)
[![Build status](https://ci.appveyor.com/api/projects/status/r219jhw6o8s5omhb?svg=true)](https://ci.appveyor.com/project/Tivgres/finderen)
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2FTivgres%2Ffinderen.svg?type=shield)](https://app.fossa.io/projects/git%2Bgithub.com%2FTivgres%2Ffinderen?ref=badge_shield)
(not fully configured CI)

**Initial information:**

* **Ruby version**

    ``2.5.3``

* **Prepare your workspace**

  ``rake prepare_workstation:development``

* **Database creation && initialization**

  ``rake db:create && rake db:migrate && rake db:seed``

****

**Development process:**

* **Launch the application**

  ``foreman start``

* **How to run the test suite**

  ``rake run_tests:core``*rspec spec/ -t core*

  ``rake run_tests:non_core`` *rspec spec/ -t non_core*

  ``rake run_tests:all`` *rspec spec/*

****

**Release process:**

* **Deployment instructions**

  ``rake prepare_workstation:production`` *(first time)*

  ``cap production deploy``

## License
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2FTivgres%2Ffinderen.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2FTivgres%2Ffinderen?ref=badge_large)