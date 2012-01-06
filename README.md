#Redmine Asset Management Plugin
###About
Its hard to keep track of *stuff*.  Everything from computers to external hard drives to software licenses.  Tracking this stuff individually can be done easily enough. Tracking it within a group, large or small, in a way that is concise, consistent, and managable is always a challenge, especially when you can't dedicate somebody to being in charge of it.

The hope is that this plugin can take some of the challenge out of that task by providing a consistent, easy to use interface with which to assemble and retrieve asset data.
###Features
+ Track hardware & software with the easy-to-learn Redmine interface
+ Track issues with hardware or software using Redmine's Issues system
+ Both hardware and software can be checked out to Users, giving at least some idea of who used something last, or who it was entrusted to.

###Screenshots

#### Coming Soon

###Version
#### Coming Soon
###Bugs
RAM is still in development, hopefully within a few days we'll have something available worthy of filing bugs on.
###Usage
####Install
1. `cd [redmine]/vendor/plugins/`
2. `git clone http://github.com/peelman/redmine_asset_management.git`
3. `rake db:migrate_plugins`
4. `touch [redmine]/tmp/restart.txt`
5. Profit?

##Author
Nick Peelman

- Email: nick@peelman.us
- Web: [peelman.us](http://peelman.us)
- Github: [Github.com/peelman](http://github.com/peelman)

##Credits
+ Special Thanks to Chris Moore (http://github.com/cdmwebs)

##Licensing
+ This plugin is open-source and licensed under the "GNU General Public License v2"  See: [GPL 2.0 Website](http://www.gnu.org/licenses/old-licenses/gpl-2.0.html) for more info.
+ &copy; 2012 Nick Peelman