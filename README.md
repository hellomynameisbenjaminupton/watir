## Watir (Selenium/Cucumber) - Automation Test Suite

This project is a suite of Automation tests written in Watir. Watir is a Selenium based framework written in Ruby.
It also includes Cucumber behavior-driven development style features.

## Install - Ruby! ##

**Introduction**

In order to run Ruby code you need to install a Ruby interpreter.

Installing a Ruby interpreter for Windows is straightforward, but for Mac and Linux it is slightly more complicated. The default Ruby interpreters normally supplied on Mac and Linux are not adequate for running Watir and related Ruby technologies without making significant alterations to them.

There are different options for properly maintaining a Ruby interpreter, but we have chosen rbenv as the most suitable Ruby interpreter for Mac and chruby for Linux.

Note that RVM is an acceptable (if more complicated) way to maintain a Ruby interpreter if you prefer to use it, but if you choose to use rbenv or chruby, be sure to uninstall RVM completely.


## WSL2

**Install git**

```shell
sudo apt-get install git
```

**Install Ruby - rbenv**

```shell
sudo apt install curl
curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update
sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn
```

```shell
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

rbenv install 3.1.2
rbenv global 3.1.2
ruby -v
```

**Install - Watir**
Once you have installed Ruby, installing and using Watir is easy.

First you need to install Bundler
```shell
gem install bundler
```

From the command line, install the gem, which Ruby’s way of packaging code:

```shell
gem install watir
bundle install
```

**Install - Chromedriver**
* You'll need to install Chromedriver for your tests to run. First download the latest stable build if Chrome if you havent already done so.
[https://www.google.com/chrome/](https://www.google.com/chrome/)
* Then go [HERE](https://chromedriver.chromium.org/downloads) to download the corresponding version of Chromedriver.
* Unzip the file youve just donwloaded and in your terminal
* CD into that folder (ie cd Downloads/chromedriver_linux64), then -

```shell
sudo mv chromedriver /usr/bin/chromedriver
sudo chown root:root /usr/bin/chromedriver
sudo chmod +x /usr/bin/chromedriver
```
You can then check Chromedriver is installed, along with the version (assuring it matches your browser version
```shell
chromedriver -v
```

## VS Code Setup

Running tests in Visual Studio Code is a little more complex than RubyMine. Once you have followed the instructions to install Ruby, Watir and all dependencies, go ahead and install Visual Studio Code, if you haven't already done so.

 * With Visual Studio Code open, go to File > Open, and navigate to \Watir\RedBalloon_CommerceCloud
 * From here you can open up the feature directory.
 

**Extensions and settings.json**
 * Open the extensions tab and search for the 'Ruby' extension and click Install
 * Search and install the Cucumber extension and the Gherkin extension
 * Assure you have a .vscode directory in your project root. Within it should be a settings.json file. If not, create this directory/file
	* Open the settings.json file again and assure the following lines are included (NOTE: I removed everything else not needed for Cucumber that was not Ruby related
```json
{
    "cucumber.features": [
        "Watir/features/*.feature"
    ],
    "cucumber.glue": [
        "Watir/features/step_definitions/*.rb",
        "Watir/features/pages/*.rb"
    ],
    "files.associations": {
        "*.feature": "cucumber"
    },
    "ruby.locate": {
        "exclude": "{**/@(test|spec|tmp|.*),**/@(test|spec|tmp|.*)/**,**/*_spec.rb}",
        "include": "{Watir/features/pages/*.rb,Watir/Env/main.rb}"
    },
    "ruby.useLanguageServer": true,
    "ruby.intellisense": "rubyLocate"
}
```

**To run tests from terminal**

    $ cucumber example.feature -r step_definitions -r pages --publish-quiet
