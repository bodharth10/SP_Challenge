# Coding Challenge
  Write a ruby script that:
> a)Receives a log as argument (webserver.log is provided) e.g.: ./parser.rb webserver.log.

> b) Returns the following:

> list of webpages with most page views ordered from most pages views to less page views e.g.:
/home 90 visits /index 80 visits etc... > list of webpages with most unique page views also ordered
e.g.:
/about/2 8 unique views /index 5 unique views etc...







## Technologies:

* Ruby 2.6.3 
* Rspec


### Setup

Navigate to directory where the code script is located

```sh
$ cd ~/SP_Test/ruby_app
```
Install the dependencies and devDependencies.

```sh
$ rvm use 2.6.3
````
````
$ gem install rspec
````
```
$ bundle install
```

### Steps to run Script

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



### Code:

The script is developed by follow basic ruby SOLID principles . As per single responsibility priciple , "A class should have only a single responsibility. So I have created 3 classes each with single responsibilty . ServerLogParser ie server_log_parser.rb is created as main class and for now it has single reponsibity to initialize and validate a log.file . LogFileParser ie log_file_parser has given responsibity to parse only a .log file. ReportGenerator class has been assigned responsibility for generating the report for logs . Reason behind creating seperate class for log_file is application of Open/close priciple ie main class is open for extensions but close for modifications . ie in future if someone wants to parse file with differnt format or extension it can be done without modifying the main class . 
As far as log_file_parser is concerned , "parse_file" method is implemented in which I have avoided using each loop with readlines  and used while loop for improving performance ie less use of memory because it avoids the loading of logs in one go which cause more usage of memory and exerts pressure on GC(garbage collector) . And then file closed using file.close after the parsing is finished to avoid memory leakage .
All the code is implemented by following Test Driven Development approach(TDD) using rspec . 

### Scope for improvements:

The ServerLogParser class can be improved for handling multiple file format currently not done implementation and since we have implemented open/close priciple multiple file formats can handled by extending it by creating classes for respective file extensions . 







