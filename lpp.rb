#!/usr/bin/env ruby

require 'rubygems'
require 'lpp'

Lpp.arrivals(ARGV[0]).each do |id,data| 
	puts "\n\n#{id} #{data[:name]}\n--------------------------------------\n\n" 
	data[:buses].each do |bus,deets| 
		puts "#{sprintf('%-40s',bus)}\t#{deets[:arrivals].map do |r| 
			%[#{r[:time]}#{'*' if r[:easy]}]
		end.join(%[\t])}"
	end
end
