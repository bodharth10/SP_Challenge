# Coding Challenge
  Write a ruby script that:
> a)Receives a log as argument (webserver.log is provided) e.g.: ./parser.rb webserver.log
  b. Returns the following:
> list of webpages with most page views ordered from most pages views to less page views e.g.:
/home 90 visits /index 80 visits etc... > list of webpages with most unique page views also ordered
e.g.:
/about/2 8 unique views /index 5 unique views etc...


### Installation

Install the dependencies and devDependencies.

```sh
$ gem install rspec

$ bundle install
```

### Steps to run Script

Navigate to directory where the code script is located

```sh
$ cd /SP_Test/ruby_app
```
Run the script by passing name of log file in my case its webserver.log
```sh
$ ruby ./print_report.rb webserver.log
```

### Steps for Testing Script

Navigate to directory where the code script is located

```sh
$ cd /SP_Test/ruby_app
```
Run the all test files as follows:
```sh
$ rspec spec/lib/*
```



