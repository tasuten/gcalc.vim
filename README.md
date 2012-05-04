# Summary
This plugin calculates the given expression using the Google Suggest API.

# require
* webapi-vim[^1] (namespace changed ver.)
https://github.com/mattn/webapi-vim
[^1]:webapi-vim require curl command http://curl.haxx.se/ .

# usage
Use like this.
:GCalc 1+1
\# => 2
:GCalc e^(pi*i)
\# => -1
:GCalc 1km in mile
\# => 0.621371192 mile
:GCalc the answer to life the universe and everything
\# => 42

