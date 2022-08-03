![CircleCI](https://img.shields.io/circleci/build/github/LeonOlberg/referable-rails/main)

![Referral](.img/referral.jpg)

# Referable Rails

## About the project
This project was created thinking about using some tools and techniques in addition to the Ruby on Rails framework.

### Business Rules

* To create a Referral you need before to have a Contact, a Contact can have many Referrals linked to it but one Referral is tied in to only one Contact;
* When a Referral is created we send they asynchronously an email to welcome;
* Every data manipulation on Referral and Contact generates en Event, so if you create a Contact, a `contact_created` event will be created with the contact id, if you create a referral, a `referral_created` event will be created with the contact id and the referral id, as well as in the case of a deletion;
* Events are also created when you send the welcome email to the referral, one (`referral_email_waiting_to_be_sent`) at the end of the referral creation and other (`referral_email_sent`) when the email effectively is sent;

## Technologies used
This project was built using:

| Technology | Version |
|---|---|
| [Ruby](https://www.ruby-lang.org/en/) | 3.1.2 |
| [Rails](https://rubyonrails.org/) | 7.0.3 |
| [Rspec](https://rspec.info/)  | 4.0.2 |
| [Sidekiq](https://sidekiq.org/) | 6.5 |
| [Postgresql](https://www.postgresql.org/ )| 14.4 |
| [Redis](https://redis.io/) | 7.0.4 |
| [Rubocop](https://github.com/rubocop/rubocop)| 1.32 |
| [Brakeman](https://brakemanscanner.org/)| 5.2 |

## How to run this project
### First time running this project? Dont worry, just follow this instructions and evertything will be alright.

You will need to have it installed previously
| Technology | Version |
|---|---|
| [Ruby](https://www.ruby-lang.org/en/) | 3.1.2 |
| [Bundler](https://bundler.io/) | 2.3.18 |
| [libpq](https://www.postgresql.org/docs/14/libpq.html) | 14 |
| [docker and docker-compose](https://docs.docker.com/) | 20.10 and 1.29 |

### Ok, now that you have all of this preseted tools intalled, lets run this!
##### On inside the project folder

This command will install all the dependencies of the project
```shell
bundle install
```

This command will initialize postgresql which is used as database and redis which is used as queue for sidekiq
```shell
docker-compose up -d
```

This command will allocate our databases for development and tests
```shell
bin/rails db:create
```

This command will our database migrations. [more of migrations on rails](https://edgeguides.rubyonrails.org/active_record_migrations.html)
```shell
bin/rails db:migrate
```

**Optional, If you want to generate some pre data on the application**
```shel
bin/rails db:seed
```

##### Now you have everything you need to run the application

**Optional, If you want to sidekiq with. [more of sidekiq](https://github.com/mperham/sidekiq/wiki/Getting-Started)**
```shel
bin/rails db:seed
```

This command will start you server application
```shell
bundle exec sidekiq
```

#### Other usefull commands
This command execute the project linter
```shell
bundle exec rubocop --parallel --config .rubocop.yml
```

This command execute the static analysis security tool
```shell
bundle exec brakeman
```

This command execute all the test suit
```shell
bundle exec rspec
```

#### To call properly the endpoints you can use some of this curl calls
##### To manipulate Contact
To list all Contacts (some additional info can be send in query params like name top filter by name or page_num and per_page to paginate)
```shell
curl --request GET \
  --url http://localhost:3000/contact
```

To create a Contact
```shell
curl --request POST \
  --url http://localhost:3000/contact \
  --header 'Content-Type: application/json' \
  --data '{
	"name": "SomeName",
	"email": "some@email",
	"address": "Some Address"
}'
```

To find a specific Contact
```shell
curl --request GET \
  --url 'http://localhost:3000/contact/CHANGE-HERE-TO-SOME-UUID'
```

To delete a Contact (If there is a referral linked with a contact, it will be deleted too)
```shell
curl --request DELETE \
  --url 'http://localhost:3000/contact/CHANGE-HERE-TO-SOME-UUID'
```

##### To manipulate Referral
To list all Referral (some additional info can be send in query params like contact_id to filter by an specific contact or page_num and per_page to paginate)
```shell
curl --request GET \
  --url http://localhost:3000/referral
```

To create a Referral
```shell
curl --request POST \
  --url http://localhost:3000/referral \
  --header 'Content-Type: application/json' \
  --data '{
	"name": "SomeName",
	"email": "some@email",
	"address": "Some Address"
}'
```

To find a specific Referral
```shell
curl --request GET \
  --url 'http://localhost:3000/referral/CHANGE-HERE-TO-SOME-UUID'
```

To delete a Referral
```shell
curl --request DELETE \
  --url 'http://localhost:3000/referral/CHANGE-HERE-TO-SOME-UUID'
```
