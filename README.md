
# Project Title

One Paragraph of project description goes here

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

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc

