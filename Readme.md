# Caboose [![Build Status](https://secure.travis-ci.org/JustinCampbell/caboose.png)](https://secure.travis-ci.org/JustinCampbell/caboose)

Template for Rails. See a sample repo at [caboose-sample](http://github.com/JustinCampbell/caboose-sample), and the same app on Heroku at [caboose-sample.herokuapp.com](http://caboose-sample.herokuapp.com/).

## Installation

```sh
git clone git://github.com/JustinCampbell/caboose.git
```

## Usage

```sh
rvm 1.9.3
gem install rails
rails new MyApp -m caboose/caboose.rb
```

## Why?

Because every time I have a great idea, I spend too much time just getting
my environment setup. I've made enough apps to know what I typically want at the
start, and it's nice to be able to jump directly into a TDD cycle within a few
minutes.

## Stuff it does

### Environment

* RVM 1.9.3
* Bundle with binstubs, without production

### Views

* Remove default Rails assets
* Slim
* Create a PagesController with root route pointing to 'pages#index'
* Page title helper

### Style

* SASS base style
* Normalize.css
* Bourbon

### Testing

* RSpec
* Turnip
* Fivemat
* Guard w/ Growl notifications
* Travis CI

### Production

* Heroku and Postgres
* Thin
* Dalli
* Google Analytics JS
* New Relic

### Coming soon, maybe

* Fabricator, or another factory
* Timecop
* Unicorn configured for Heroku
* VCR

For more detail you should probably check out the [source code](https://github.com/JustinCampbell/caboose/blob/master/caboose.rb).

