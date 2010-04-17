#!/usr/local/bin/ruby
# -*- coding: utf-8 -*-

module Sample
  
  # created when request.params["mode"] is not inputed.
  class Default
    def initialize
    end

    attr_accessor :cgi, :session, :params, :logger, :store
    
    def run
      @time = Sample::Logic.get_time
      @logger.debug "Time : #{@time}"
    end
    
    def response
      erb = ERB.new(File.open("erb/sample/default.html.erb", "r:utf-8") {|f| f.read}, nil, "-")
      erb.result(binding)
    end
  end
  
  # created when request.params["mode"] is "showday".
  class Showday
    def initialize
    end
    
    attr_accessor :cgi, :session, :params, :logger, :store
    
    def run
      @day = Sample::Logic.get_day
    end
    
    def response
      erb = ERB.new(File.open("erb/sample/showday.html.erb", "r:utf-8") {|f| f.read}, nil, "-")
      erb.result(binding)
    end
  end
  
end
