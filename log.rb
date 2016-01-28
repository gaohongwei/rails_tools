The Logger
http://railscasts.com/episodes/56-the-logger

ActiveRecord::Base.logger = YouLogger.new

In Rails 4 all 
replace Rails.logger in an initializer.

exception_logger
https://github.com/defunkt/exception_logger/tree/master

######
require 'singleton'
class Log2db < Logger
  def format_message(severity, timestamp, progname, msg)
    "wgh #{timestamp.to_formatted_s(:db)} #{severity} #{msg}\n"
    Template.create(name:msg,subject:msg,body:msg)
  end
end

# initializer
logfile = File.open("#{Rails.root}/log/custom.log", 'a')  # create log file
logfile.sync = true  # automatically flushes data to file
CUSTOM_LOGGER = Log2db.new(logfile)  # constant accessible anywhere
Rails.logger.extend(ActiveSupport::Logger.broadcast(CUSTOM_LOGGER))
