# Weather report

__Weather report__ is a *console* based app for [showing weather](https://www.meteoservice.ru/content/export) using XML parsing

ver.: 0.9
 
Created by v.n.zubarev@gmail.com on *03/11/18*
```
require 'net/http'
require 'rexml/document'
```

1). First, clone this repo to your laptop or computer using terminal (command line):
  `git clone https://github.com/VovkaZy/weather_report.git`

2). After this, change the directory to that, wich contain app files.
  `cd dirpath/weather_report/`

3). Run it from terminal (command line): 
  `ruby weather.rb`

P.S.: If you want to change city, just open app file `weather.rb`, change a `uri` variable link to your city using website from head and save it.
