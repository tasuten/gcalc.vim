# Summary
This plugin calculates the given expression using the Google Suggest API.

# Require
* webapi-vim
https://github.com/mattn/webapi-vim
* webapi-vim requires curl command.
http://curl.haxx.se/

# Usage
Use like this.

    :GCalc 1+1
    # => 2
    :GCalc e^(pi*i)
    # => -1
    :GCalc 1km in mile
    # => 0.621371192 mile
    :GCalc the answer to life the universe and everything
    # => 42

# Known problems
These problems are caused by Google Suggest API's data format.
This plugin print first element of Google Suggest API's suggest data,
so sometimes this plugin print unwished result.

e.g.

* a -> 'amazon'
    * It must be error
* 1/4 -> '1/4-20unc'
    * It must be 0.25
    * You can avoid this problem by doing like this(add space)
    * 1 / 4 -> '0.25'

