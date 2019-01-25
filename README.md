
# Virtual Bartender

A simple CLI app replicating the interaction you would have with a bartender. You can order drinks, ask questions about the drinks and get some cheeky jokes!

## Getting Started

1. Fork a copy of this project from the repository and clone it in your chosen folder on your computer.
2. Ensure that you have installed the prerequisites as described below.
3. Open your terminal and navigate to the project folder.
4. run 'bundle install' to ensure that you have the required gems.
5. run 'rake db:migrate" to create an instance of the database on your computer.
6. run 'ruby bin/run.rb' to run the program.

### Prerequisites

* A sense of humor
* Ruby 2.3.3 or later
  - Here is a guide for installing ruby
* Install Homebrew
  - run the following in your terminal: 'brew install imagemagick@6'
* Add the following to your BASH profile
  - export MAGICK_HOME="$HOME/flatiron/installs/ImageMagick-7.0.8"
  - If you are running MacOS 'Mojave', you will also need to add the following: export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

### Common Questions:
- How do I turn off my SQL logger?
```ruby
# in config/environment.rb add this line:
ActiveRecord::Base.logger = nil
```

## Deployment

In the console, enter:

```
ruby .bin/run.rb
```

## Built With

* [ActiveRecord](https://github.com/rails/rails/tree/master/activerecord) - The database framework used
* [asciiart](https://github.com/nodanaonlyzuul/asciiart/) - Used to generate our opening bar image
* [tty-prompt](https://github.com/piotrmurach/tty-prompt) - Used to enable al prompt tasks
* [catpix](https://github.com/pazdera/catpix) - Used to generate the cocktail images


## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [Github](https://github.com/jchaselubitz/module-one-final-project-guidelines-london-web-career-010719) for versioning. For the versions available, see the [tags on this repository](https://github.com/jchaselubitz/module-one-final-project-guidelines-london-web-career-010719/tags).

## Authors

* **Jake Chase-Lubitz** - *Initial work* - [jchaselubitz](https://github.com/jchaselubitz)
* **Matthew Collins** - *Initial work* - [triggerukmc](https://github.com/triggerukmc)

## License

This project is licensed under the Learn.co Educational Content License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Sam Barker for sorting out all the Gem and environment issues!
* Stack overflow
* Google
