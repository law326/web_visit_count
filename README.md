# Webpages Unique Visit Count

This script counts the unique visit to each URL from a provided server log.

# Run the script

You can run the script with two different ways:
- Run it locally
- Run it through Docker(Recommended)

# Run It Locally

## Prerequisites
You will need to have following installed before start running the application:
  - Ruby 2.6.x
  - PostgreSQL 9.x or above

## Setup
You may need to update `db/config.yml` with your database credential before running the setup.

```
> bundle install
> bundle exec rake db:create
> bundle exec rake db:migrate
```

Alternatively, you can provide environment variable when you run following commands to setup the environment:
  ```
  > bundle install
  > DATABASE_USERNAME=XXX DATABASE_PASSWORD=XXX bundle exec rake db:create
  > DATABASE_USERNAME=XXX DATABASE_PASSWORD=XXX bundle exec rake db:migrate
  ```

## Start
Place the log file in `data` folder and then run the following command:
```
bundle exec ruby parser.rb data/{your_log_file_name}
```

Or
```
DATABASE_USERNAME=XXX DATABASE_PASSWORD=XXX bundle exec ruby parser.rb data/{your_log_file_name}
```
if you didn't change `db/config.yml` with your DB credential.

Result will be displayed on the console.

# Run the tests

## Setup
Run following commands to setup:
```
> DATABASE_USERNAME=XXX DATABASE_PASSWORD=XXX bundle exec rake db:create
> RAILS_ENV=test DATABASE_USERNAME=XXX DATABASE_PASSWORD=XXX bundle exec rake db:migrate
```

## Start
To run the test, run:
```
DATABASE_USERNAME=XXX DATABASE_PASSWORD=XXX bundle exec rspec spec
```

# Run It Through Docker

You can run the script within Docker container to avoid any setup.
Download and install Docker to your local machine and run the following commands:

```
> docker-compose build
> docker-compose up -d
```

Then to execute the script:
```
> docker-compose exec app bundle exec ruby parser.rb data/{your_log_file_name}
```

To run the test:
```
> docker-compose exec app bundle exec rspec spec
```


## Why Database?
Web server logs are often very big and by importing into database the application has the capacity to process very large log file.
