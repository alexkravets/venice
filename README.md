# Venice

*Where art meets technology.*

`v` `e` `n` `i` `c` `e` is boilderplate website & blog implementation based on
[Character](https://github.com/slate-studio/chr) library. It's used as
boilerplate for new Rails projects or quick prototypes.

Homepage: https://github.com/alexkravets/venice

## Installation

It assumes you have a machine equipped with Ruby & Mongodb.

1. Install the Venice gem using the [RubyGems](https://rubygems.org) package
manager:

  ```bash
  gem install venice-chr
  ```

2. Then kick off a new project:

  ```bash
  venice new your-project-name
  ```

## Shortcuts

We’ve also included some handy shortcuts with Venice:

- Install dependencies and clear the Git remote:

  ```bash
  venice setup
  ```

Default admin account is `user@example.com`:`password`.

- Run the deploy (supported platforms: Heroku):

  ```bash
  venice deploy
  ```

Default admin account: is `user@example.com`:`password`. After deploy is
finished, please login and create a new account, then remove default one.

- Start Venice server:

  ```bash
  rails s
  ```

## Contributing

If you'd like to contribute a feature or bugfix: Thanks! To make sure your
fix/feature has a high chance of being included, please read the following
guidelines:

1. Fork the repository
2. Make your changes
3. Push your branch to your fork
4. Post a [pull request](https://github.com/alexkravets/venice/compare).

Thank you to all
[the contributors](https://github.com/alexkraves/venice/contributors)!