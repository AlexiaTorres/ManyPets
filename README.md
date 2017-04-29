# README


To install and run the application

```
git clone xxx
cd manypets
bundle install
rails db:migrate
rails db:seed
rails s
```

To test and lint it we should install rubocop to make checks against code quality

```
gem install rubocop
rubocop
rails test
```

TODO
--
- Finish controller testing and make integration tests too
- Deploy a example of the application in heroku
- Allow uploading images of the pets
- Social login so people can only edit their own pets
- Give pet category its own model and table in database
- Make it multilingual
- Like and comment system
- ....


