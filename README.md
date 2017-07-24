Foosball Ranking System 
========================
[![CircleCI](https://circleci.com/gh/gamesover/foosball_ranking_system.svg?style=svg)](https://circleci.com/gh/gamesover/foosball_ranking_system)

For multiple players to play games

### Technical Stack  ###

* Ruby on Rails 
* Frontend uses Adminlte, bootstrap based UI framework
* CI is checked by Circle CI
* Deploy to heroku 

### Heroku Setup ###

This project relies on 3 [buildpacks](https://devcenter.heroku.com/articles/buildpacks)
* heroku/ruby (heroku official version)
* https://github.com/gunpowderlabs/buildpack-ruby-rake-deploy-tasks (for db migrate after deploy) 
* set a heroku server env variable `DEPLOY_TASKS = db:migrate tmp:clear`
* heroku/nodejs (currently for adminlte only)

Make sure you config everything correctly.

### Note ###
* `.circle/config.yml` for *CI*
* config at `heroku` side so it auto *CD* after passing *CI*
* When github merge the branch to the master, after CI pass, heroku will pull the latest master, deploy and db migrate automatically
* `rubocop` and other test tools, such as `factorygirl` and `capybara` are not set yet

### Dev Env Setup ###
* `rails s` to start `rails` server, `yarn` to install `nodejs` package
* make sure pass and create all `rspec`

### Contribution guidelines ###

* Writing tests
* Code review
* Other guidelines

### Who do I talk to? ###

* Repo owner or admin
* Other community or team contact