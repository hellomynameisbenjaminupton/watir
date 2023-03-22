

## **Watir (Selenium/Cucumber) - Automation Test Suite**

  

This project is a suite of Automation tests written in Watir. Watir is a Selenium based framework written in Ruby.

It also includes Cucumber behavior-driven development style features.

  

*Please view the project Wiki for Installation, project structure, how to write tests in Watir and other documents*

  

[Watir - Automation Wiki](https://bitbucket.org/redballoon/automation-tests-redballoon/wiki/Home)


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

