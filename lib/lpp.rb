# encoding: UTF-8

require "lpp/version"
require 'net/http'
require 'nokogiri'
require 'open-uri'

module Lpp
  REGEX = /NAPOVED PRIHODOV ZA (.+?) \((.+?)\)(.+?)(?:NAPOVED PRIHODOV ZA (.+?) \((.+?)\)(.+?))?Napovedi/m

  def self.arrivals(station)
    http = Net::HTTP.new('wbus.talktrack.com')
    data = "__EVENTTARGET=&__EVENTARGUMENT=&tb_postaja=#{station}&b_send=Prika%C5%BEi"
    headers = {
      'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/537.36 (KHTML, like Gecko)',
      'Content-Type' => 'application/x-www-form-urlencoded'
    }
    res = http.post('/wap.aspx', data, headers)
    text = Nokogiri::HTML(res.body).text

    raise 'Station not found' if /Postaje s tem imenom nismo našli/.match(text)

    matches = REGEX.match(text)
    result = Hash.new

    result[matches[2]] = {name: matches[1], buses: parse(matches[3])}

    # Twice if there are two statons
    if matches[4]
      result[matches[5]] = {name: matches[4], buses: parse(matches[6])}
    end

    result
  end

  def self.arrivals_for_bus(station, bus)
    arrivals = arrivals(station)
    result = Hash.new
    arrivals.each do |station_key, station_value|
      buses = station_value[:buses].select do |bus_entry|
        bus_entry =~ /^#{bus}/
      end
      if !buses.empty?
        result[station_key] = {name: station_value[:name], buses: buses}
      end
    end
    result
  end

  def self.parse(buses)
    result = Hash.new
    buses.strip.split("\r\n").each do |bus|
      matches = /(\d+)(?:\s+(.))? (.*?)\:(?:\s(n))? (\d+\:\d+)(?:,(?:\s(n))? (\d+\:\d+))?(?:,(?:\s(n))? (\d+\:\d+))?/.match(bus)
      if matches
        times = ([matches[5]] + [matches[7]] + [matches[9]]).compact
        easy = ([matches[4]] + [matches[6]] + [matches[8]])
        bus_number = matches[1]+matches[2].to_s
        result[bus_number + " " + matches[3]] = {
          route: matches[3],
          bus_number: bus_number,
          arrivals: times.each_with_index.map do |time, index|
            {time: time, easy: easy[index] == 'n'}
          end
        }
      end
    end
    result
  end
end
