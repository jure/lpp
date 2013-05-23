# encoding: UTF-8

require 'test/unit'
require 'lpp'
require 'test_helper'

class LppTest < Test::Unit::TestCase
  def test_requesting
    WebMock.allow_net_connect!
    arrivals = Lpp.arrivals('bavarski')
    assert_equal (arrivals['600011'] != nil), true
    WebMock.disable_net_connect!
  end

  def test_parsing
    response = File.read(File.join(File.dirname(__FILE__), 'response.html'))
    stub_request(:any, /wbus.talktrack.com\/.*/).
      to_return(:body => response, :status => 200,  :headers => { 'Content-Length' => response.length } )

    arrivals = Lpp.arrivals('bavarski')

    result_hash = {"600012"=>
      {:name=>"BAVARSKI DVOR",
       :buses=>
        {"1N BROD - BAVARSKI DVOR"=>
          {:route=>"BROD - BAVARSKI DVOR",
           :bus_number=>"1N",
           :arrivals=>
            [{:time=>"02:59", :easy=>false},
             {:time=>"03:24", :easy=>false},
             {:time=>"04:05", :easy=>false}]},
         "1N BAVARSKI DVOR - BROD"=>
          {:route=>"BAVARSKI DVOR - BROD",
           :bus_number=>"1N",
           :arrivals=>
            [{:time=>"23:40", :easy=>false},
             {:time=>"00:20", :easy=>false},
             {:time=>"02:50", :easy=>false}]},
         "1N BAVARSKI DVOR - VIŽMARJE"=>
          {:route=>"BAVARSKI DVOR - VIŽMARJE",
           :bus_number=>"1N",
           :arrivals=>[{:time=>"04:50", :easy=>false}]},
         "1N MESTNI LOG - BAVARSKI DVOR - GAMELJNE"=>
          {:route=>"MESTNI LOG - BAVARSKI DVOR - GAMELJNE",
           :bus_number=>"1N",
           :arrivals=>
            [{:time=>"22:28", :easy=>false}, {:time=>"22:58", :easy=>false}]},
         "1N GAMELJNE - BAVARSKI DVOR"=>
          {:route=>"GAMELJNE - BAVARSKI DVOR",
           :bus_number=>"1N",
           :arrivals=>
            [{:time=>"23:34", :easy=>false}, {:time=>"00:14", :easy=>false}]},
         "2 ZELENA JAMA - GARAŽA"=>
          {:route=>"ZELENA JAMA - GARAŽA",
           :bus_number=>"2",
           :arrivals=>[{:time=>"00:42", :easy=>true}]},
         "2 ZELENA JAMA - NOVE JARŠE"=>
          {:route=>"ZELENA JAMA - NOVE JARŠE",
           :bus_number=>"2",
           :arrivals=>
            [{:time=>"21:28", :easy=>true},
             {:time=>"21:44", :easy=>true},
             {:time=>"21:59", :easy=>false}]},
         "3L TOVARNA LEK - BAVARSKI DVOR"=>
          {:route=>"TOVARNA LEK - BAVARSKI DVOR",
           :bus_number=>"3L",
           :arrivals=>[{:time=>"22:16", :easy=>false}]},
         "3N BAVARSKI DVOR - RUDNIK"=>
          {:route=>"BAVARSKI DVOR - RUDNIK",
           :bus_number=>"3N",
           :arrivals=>
            [{:time=>"21:40", :easy=>false},
             {:time=>"22:00", :easy=>true},
             {:time=>"22:20", :easy=>false}]},
         "3N BAVARSKI DVOR - ŠKOFLJICA"=>
          {:route=>"BAVARSKI DVOR - ŠKOFLJICA",
           :bus_number=>"3N",
           :arrivals=>
            [{:time=>"04:50", :easy=>false}, {:time=>"21:20", :easy=>false}]},
         "3 LITOSTROJ - RUDNIK"=>
          {:route=>"LITOSTROJ - RUDNIK",
           :bus_number=>"3",
           :arrivals=>[{:time=>"21:01", :easy=>false}]},
         "3L BAVARSKI DVOR - TOVARNA LEK"=>
          {:route=>"BAVARSKI DVOR - TOVARNA LEK",
           :bus_number=>"3L",
           :arrivals=>[{:time=>"21:25", :easy=>false}]},
         "3N ŠKOFLJICA - BAVARSKI DVOR"=>
          {:route=>"ŠKOFLJICA - BAVARSKI DVOR",
           :bus_number=>"3N",
           :arrivals=>[{:time=>"21:37", :easy=>false}]},
         "3G BEŽIGRAD - GROSUPLJE"=>
          {:route=>"BEŽIGRAD - GROSUPLJE",
           :bus_number=>"3G",
           :arrivals=>
            [{:time=>"21:35", :easy=>false},
             {:time=>"22:35", :easy=>false},
             {:time=>"23:44", :easy=>false}]},
         "5N ŠTEPANJSKO NAS. - PODUTIK"=>
          {:route=>"ŠTEPANJSKO NAS. - PODUTIK",
           :bus_number=>"5N",
           :arrivals=>
            [{:time=>"21:30", :easy=>false},
             {:time=>"22:00", :easy=>false},
             {:time=>"22:29", :easy=>true}]},
         "6 ČRNUČE - DOLGI MOST"=>
          {:route=>"ČRNUČE - DOLGI MOST",
           :bus_number=>"6",
           :arrivals=>
            [{:time=>"21:25", :easy=>true},
             {:time=>"21:48", :easy=>false},
             {:time=>"22:00", :easy=>false}]},
         "6 ČRNUČE - GARAŽA"=>
          {:route=>"ČRNUČE - GARAŽA",
           :bus_number=>"6",
           :arrivals=>[{:time=>"00:53", :easy=>false}]},
         "6B ČRNUČE - NOTRANJE GORICE"=>
          {:route=>"ČRNUČE - NOTRANJE GORICE",
           :bus_number=>"6B",
           :arrivals=>
            [{:time=>"21:41", :easy=>false},
             {:time=>"22:28", :easy=>true},
             {:time=>"04:47", :easy=>false}]},
         "7 NOVE JARŠE - PRŽAN"=>
          {:route=>"NOVE JARŠE - PRŽAN",
           :bus_number=>"7",
           :arrivals=>
            [{:time=>"21:23", :easy=>true},
             {:time=>"21:43", :easy=>false},
             {:time=>"05:13", :easy=>false}]},
         "7 NOVE JARŠE - GARAŽA"=>
          {:route=>"NOVE JARŠE - GARAŽA",
           :bus_number=>"7",
           :arrivals=>
            [{:time=>"22:38", :easy=>true},
             {:time=>"23:00", :easy=>false},
             {:time=>"08:22", :easy=>false}]},
         "7L LETALIŠKA - PRŽAN"=>
          {:route=>"LETALIŠKA - PRŽAN",
           :bus_number=>"7L",
           :arrivals=>
            [{:time=>"22:04", :easy=>false},
             {:time=>"22:28", :easy=>true},
             {:time=>"05:55", :easy=>false}]},
         "8 BRNČIČEVA - GAMELJNE"=>
          {:route=>"BRNČIČEVA - GAMELJNE",
           :bus_number=>"8",
           :arrivals=>
            [{:time=>"21:40", :easy=>false},
             {:time=>"22:00", :easy=>true},
             {:time=>"05:18", :easy=>false}]},
         "8 BRNČIČEVA - GARAŽA"=>
          {:route=>"BRNČIČEVA - GARAŽA",
           :bus_number=>"8",
           :arrivals=>
            [{:time=>"22:22", :easy=>false}, {:time=>"22:42", :easy=>true}]},
         "9 ŠTEPANJSKO NAS. - GARAŽA"=>
          {:route=>"ŠTEPANJSKO NAS. - GARAŽA",
           :bus_number=>"9",
           :arrivals=>
            [{:time=>"22:44", :easy=>false},
             {:time=>"23:02", :easy=>false},
             {:time=>"11:16", :easy=>false}]},
         "9 ŠTEPANJSKO NAS. - TRNOVO"=>
          {:route=>"ŠTEPANJSKO NAS. - TRNOVO",
           :bus_number=>"9",
           :arrivals=>
            [{:time=>"21:30", :easy=>false},
             {:time=>"21:47", :easy=>false},
             {:time=>"22:09", :easy=>true}]},
         "11 BEŽIGRAD - ZALOG"=>
          {:route=>"BEŽIGRAD - ZALOG",
           :bus_number=>"11",
           :arrivals=>
            [{:time=>"21:44", :easy=>false},
             {:time=>"22:19", :easy=>true},
             {:time=>"22:59", :easy=>false}]},
         "11 JEŽICA - ZALOG"=>
          {:route=>"JEŽICA - ZALOG",
           :bus_number=>"11",
           :arrivals=>
            [{:time=>"05:06", :easy=>false},
             {:time=>"05:08", :easy=>false},
             {:time=>"05:24", :easy=>false}]},
         "14 SAVLJE - VRHOVCI"=>
          {:route=>"SAVLJE - VRHOVCI",
           :bus_number=>"14",
           :arrivals=>
            [{:time=>"21:43", :easy=>true},
             {:time=>"22:04", :easy=>false},
             {:time=>"22:29", :easy=>false}]},
         "14B SAVLJE - BOKALCE"=>
          {:route=>"SAVLJE - BOKALCE",
           :bus_number=>"14B",
           :arrivals=>
            [{:time=>"05:28", :easy=>false},
             {:time=>"05:55", :easy=>false},
             {:time=>"06:07", :easy=>false}]},
         "14 SAVLJE - GARAŽA"=>
          {:route=>"SAVLJE - GARAŽA",
           :bus_number=>"14",
           :arrivals=>
            [{:time=>"22:34", :easy=>true},
             {:time=>"22:58", :easy=>true},
             {:time=>"09:23", :easy=>false}]},
         "19I TOMAČEVO - IG"=>
          {:route=>"TOMAČEVO - IG",
           :bus_number=>"19I",
           :arrivals=>[{:time=>"10:48", :easy=>false}]},
         "19I TOMAČEVO - GARAŽA"=>
          {:route=>"TOMAČEVO - GARAŽA",
           :bus_number=>"19I",
           :arrivals=>
            [{:time=>"08:03", :easy=>false},
             {:time=>"08:28", :easy=>false},
             {:time=>"08:53", :easy=>false}]},
         "19B TOMAČEVO - JEZERO"=>
          {:route=>"TOMAČEVO - JEZERO",
           :bus_number=>"19B",
           :arrivals=>
            [{:time=>"21:58", :easy=>true},
             {:time=>"22:44", :easy=>true},
             {:time=>"04:34", :easy=>false}]},
         "19I TOMAČEVO - IŠKA VAS"=>
          {:route=>"TOMAČEVO - IŠKA VAS",
           :bus_number=>"19I",
           :arrivals=>
            [{:time=>"21:38", :easy=>false},
             {:time=>"22:18", :easy=>false},
             {:time=>"22:57", :easy=>false}]},
         "20 NOVE STOŽICE - GARAŽA"=>
          {:route=>"NOVE STOŽICE - GARAŽA",
           :bus_number=>"20",
           :arrivals=>[{:time=>"22:52", :easy=>false}]},
         "20 NOVE STOŽICE - FUŽINE"=>
          {:route=>"NOVE STOŽICE - FUŽINE",
           :bus_number=>"20",
           :arrivals=>
            [{:time=>"21:34", :easy=>false},
             {:time=>"21:54", :easy=>true},
             {:time=>"22:13", :easy=>true}]},
         "23 KOLODVOR - ZOO"=>
          {:route=>"KOLODVOR - ZOO",
           :bus_number=>"23",
           :arrivals=>
            [{:time=>"09:02", :easy=>false},
             {:time=>"10:02", :easy=>false},
             {:time=>"12:02", :easy=>false}]},
         "25 ZADOBROVA - MEDVODE"=>
          {:route=>"ZADOBROVA - MEDVODE",
           :bus_number=>"25",
           :arrivals=>
            [{:time=>"21:36", :easy=>true},
             {:time=>"22:36", :easy=>false},
             {:time=>"05:04", :easy=>false}]},
         "25 ZADOBROVA - GARAŽA"=>
          {:route=>"ZADOBROVA - GARAŽA",
           :bus_number=>"25",
           :arrivals=>[{:time=>"23:34", :easy=>true}]},
         "27 LETALIŠKA - GARAŽA"=>
          {:route=>"LETALIŠKA - GARAŽA",
           :bus_number=>"27",
           :arrivals=>
            [{:time=>"22:28", :easy=>true},
             {:time=>"22:48", :easy=>false},
             {:time=>"00:15", :easy=>false}]},
         "27 LETALIŠKA - BTC - NS RUDNIK"=>
          {:route=>"LETALIŠKA - BTC - NS RUDNIK",
           :bus_number=>"27",
           :arrivals=>
            [{:time=>"21:28", :easy=>true},
             {:time=>"21:48", :easy=>false},
             {:time=>"22:08", :easy=>false}]},
         "27B LETALIŠKA - BTC - BLEIWEISOVA"=>
          {:route=>"LETALIŠKA - BTC - BLEIWEISOVA",
           :bus_number=>"27B",
           :arrivals=>[{:time=>"23:23", :easy=>false}]},
         "51 LJUBLJANA-POLHOV GRADEC"=>
          {:route=>"LJUBLJANA-POLHOV GRADEC",
           :bus_number=>"51",
           :arrivals=>
            [{:time=>"22:46", :easy=>false},
             {:time=>"05:36", :easy=>false},
             {:time=>"06:27", :easy=>false}]},
         "56 LJUBLJANA-ŠENTJOŠT"=>
          {:route=>"LJUBLJANA-ŠENTJOŠT",
           :bus_number=>"56",
           :arrivals=>
            [{:time=>"22:36", :easy=>false},
             {:time=>"05:21", :easy=>false},
             {:time=>"06:41", :easy=>false}]}}},
     "600011"=>
      {:name=>"BAVARSKI DVOR",
       :buses=>
        {"1N VIŽMARJE - BAVARSKI DVOR"=>
          {:route=>"VIŽMARJE - BAVARSKI DVOR",
           :bus_number=>"1N",
           :arrivals=>[{:time=>"22:55", :easy=>false}]},
         "2 NOVE JARŠE - ZELENA JAMA"=>
          {:route=>"NOVE JARŠE - ZELENA JAMA",
           :bus_number=>"2",
           :arrivals=>
            [{:time=>"21:30", :easy=>true},
             {:time=>"21:47", :easy=>false},
             {:time=>"21:58", :easy=>false}]},
         "2 NOVE JARŠE - GARAŽA"=>
          {:route=>"NOVE JARŠE - GARAŽA",
           :bus_number=>"2",
           :arrivals=>
            [{:time=>"00:31", :easy=>false}, {:time=>"01:06", :easy=>true}]},
         "3G GROSUPLJE - BEŽIGRAD "=>
          {:route=>"GROSUPLJE - BEŽIGRAD ",
           :bus_number=>"3G",
           :arrivals=>
            [{:time=>"22:24", :easy=>false},
             {:time=>"23:25", :easy=>false},
             {:time=>"05:04", :easy=>false}]},
         "5N PODUTIK - ŠTEPANJSKO NAS."=>
          {:route=>"PODUTIK - ŠTEPANJSKO NAS.",
           :bus_number=>"5N",
           :arrivals=>
            [{:time=>"21:32", :easy=>true},
             {:time=>"21:59", :easy=>false},
             {:time=>"22:29", :easy=>false}]},
         "6B NOTRANJE GORICE - GARAŽA"=>
          {:route=>"NOTRANJE GORICE - GARAŽA",
           :bus_number=>"6B",
           :arrivals=>[{:time=>"23:30", :easy=>true}]},
         "6 DOLGI MOST - ČRNUČE"=>
          {:route=>"DOLGI MOST - ČRNUČE",
           :bus_number=>"6",
           :arrivals=>
            [{:time=>"21:45", :easy=>true},
             {:time=>"22:16", :easy=>false},
             {:time=>"23:40", :easy=>false}]},
         "6 DOLGI MOST - GARAŽA"=>
          {:route=>"DOLGI MOST - GARAŽA",
           :bus_number=>"6",
           :arrivals=>
            [{:time=>"22:44", :easy=>false},
             {:time=>"00:52", :easy=>false},
             {:time=>"09:24", :easy=>false}]},
         "6B NOTRANJE GORICE - ČRNUČE"=>
          {:route=>"NOTRANJE GORICE - ČRNUČE",
           :bus_number=>"6B",
           :arrivals=>
            [{:time=>"21:28", :easy=>false},
             {:time=>"21:58", :easy=>true},
             {:time=>"22:31", :easy=>true}]},
         "7L PRŽAN - LETALIŠKA"=>
          {:route=>"PRŽAN - LETALIŠKA",
           :bus_number=>"7L",
           :arrivals=>
            [{:time=>"21:24", :easy=>false},
             {:time=>"21:45", :easy=>true},
             {:time=>"05:14", :easy=>false}]},
         "7 PRŽAN - NOVE JARŠE"=>
          {:route=>"PRŽAN - NOVE JARŠE",
           :bus_number=>"7",
           :arrivals=>
            [{:time=>"22:04", :easy=>true},
             {:time=>"22:28", :easy=>false},
             {:time=>"07:41", :easy=>false}]},
         "8 GAMELJNE - BRNČIČEVA"=>
          {:route=>"GAMELJNE - BRNČIČEVA",
           :bus_number=>"8",
           :arrivals=>
            [{:time=>"21:38", :easy=>false},
             {:time=>"22:01", :easy=>true},
             {:time=>"05:27", :easy=>false}]},
         "9 TRNOVO - GARAŽA"=>
          {:route=>"TRNOVO - GARAŽA",
           :bus_number=>"9",
           :arrivals=>
            [{:time=>"22:33", :easy=>true}, {:time=>"22:53", :easy=>true}]},
         "9 TRNOVO - ŠTEPANJSKO NAS."=>
          {:route=>"TRNOVO - ŠTEPANJSKO NAS.",
           :bus_number=>"9",
           :arrivals=>
            [{:time=>"21:27", :easy=>true},
             {:time=>"21:49", :easy=>true},
             {:time=>"22:09", :easy=>false}]},
         "11 ZALOG - GARAŽA"=>
          {:route=>"ZALOG - GARAŽA",
           :bus_number=>"11",
           :arrivals=>
            [{:time=>"00:40", :easy=>true}, {:time=>"01:20", :easy=>false}]},
         "11 ZALOG - JEŽICA"=>
          {:route=>"ZALOG - JEŽICA",
           :bus_number=>"11",
           :arrivals=>
            [{:time=>"05:29", :easy=>false},
             {:time=>"05:44", :easy=>false},
             {:time=>"05:57", :easy=>false}]},
         "11 ZALOG - BEŽIGRAD"=>
          {:route=>"ZALOG - BEŽIGRAD",
           :bus_number=>"11",
           :arrivals=>
            [{:time=>"21:47", :easy=>true},
             {:time=>"22:00", :easy=>true},
             {:time=>"22:20", :easy=>false}]},
         "13 SOSTRO - GARAŽA"=>
          {:route=>"SOSTRO - GARAŽA",
           :bus_number=>"13",
           :arrivals=>
            [{:time=>"21:31", :easy=>false},
             {:time=>"22:29", :easy=>true},
             {:time=>"23:19", :easy=>true}]},
         "13 SOSTRO - CENTER STOŽICE"=>
          {:route=>"SOSTRO - CENTER STOŽICE",
           :bus_number=>"13",
           :arrivals=>
            [{:time=>"21:26", :easy=>true},
             {:time=>"22:01", :easy=>true},
             {:time=>"05:16", :easy=>false}]},
         "14 VRHOVCI - SAVLJE"=>
          {:route=>"VRHOVCI - SAVLJE",
           :bus_number=>"14",
           :arrivals=>
            [{:time=>"22:29", :easy=>true},
             {:time=>"05:15", :easy=>false},
             {:time=>"05:29", :easy=>false}]},
         "14 VRHOVCI - GARAŽA"=>
          {:route=>"VRHOVCI - GARAŽA",
           :bus_number=>"14",
           :arrivals=>
            [{:time=>"21:43", :easy=>false},
             {:time=>"22:36", :easy=>false},
             {:time=>"23:01", :easy=>false}]},
         "14B BOKALCE - SAVLJE"=>
          {:route=>"BOKALCE - SAVLJE",
           :bus_number=>"14B",
           :arrivals=>
            [{:time=>"21:44", :easy=>false},
             {:time=>"22:04", :easy=>true},
             {:time=>"05:44", :easy=>false}]},
         "19 IG AP - GARAŽA"=>
          {:route=>"IG AP - GARAŽA",
           :bus_number=>"19",
           :arrivals=>[{:time=>"08:21", :easy=>false}]},
         "19B JEZERO - GARAŽA"=>
          {:route=>"JEZERO - GARAŽA",
           :bus_number=>"19B",
           :arrivals=>
            [{:time=>"22:59", :easy=>true},
             {:time=>"23:34", :easy=>false},
             {:time=>"23:39", :easy=>true}]},
         "19B JEZERO - TOMAČEVO"=>
          {:route=>"JEZERO - TOMAČEVO",
           :bus_number=>"19B",
           :arrivals=>
            [{:time=>"21:42", :easy=>false},
             {:time=>"22:26", :easy=>false},
             {:time=>"05:21", :easy=>false}]},
         "19I IŠKA VAS - TOMAČEVO"=>
          {:route=>"IŠKA VAS - TOMAČEVO",
           :bus_number=>"19I",
           :arrivals=>
            [{:time=>"22:08", :easy=>true},
             {:time=>"05:12", :easy=>false},
             {:time=>"05:44", :easy=>false}]},
         "19I IŠKA VAS - GARAŽA"=>
          {:route=>"IŠKA VAS - GARAŽA",
           :bus_number=>"19I",
           :arrivals=>
            [{:time=>"22:41", :easy=>false},
             {:time=>"23:21", :easy=>false},
             {:time=>"23:56", :easy=>false}]},
         "20 FUŽINE - NOVE STOŽICE"=>
          {:route=>"FUŽINE - NOVE STOŽICE",
           :bus_number=>"20",
           :arrivals=>
            [{:time=>"21:34", :easy=>true},
             {:time=>"21:56", :easy=>true},
             {:time=>"22:16", :easy=>true}]},
         "20 FUŽINE - GARAŽA"=>
          {:route=>"FUŽINE - GARAŽA",
           :bus_number=>"20",
           :arrivals=>
            [{:time=>"22:58", :easy=>true}, {:time=>"23:16", :easy=>true}]},
         "23 ZOO - KOLODVOR"=>
          {:route=>"ZOO - KOLODVOR",
           :bus_number=>"23",
           :arrivals=>
            [{:time=>"10:30", :easy=>false},
             {:time=>"12:30", :easy=>false},
             {:time=>"16:31", :easy=>false}]},
         "25 MEDVODE - ZADOBROVA"=>
          {:route=>"MEDVODE - ZADOBROVA",
           :bus_number=>"25",
           :arrivals=>
            [{:time=>"21:35", :easy=>false},
             {:time=>"22:49", :easy=>true},
             {:time=>"05:28", :easy=>false}]},
         "27 NS RUDNIK - BTC - LETALIŠKA"=>
          {:route=>"NS RUDNIK - BTC - LETALIŠKA",
           :bus_number=>"27",
           :arrivals=>
            [{:time=>"21:24", :easy=>false},
             {:time=>"21:45", :easy=>true},
             {:time=>"22:05", :easy=>false}]},
         "27 NS RUDNIK - GARAŽA"=>
          {:route=>"NS RUDNIK - GARAŽA",
           :bus_number=>"27",
           :arrivals=>
            [{:time=>"22:43", :easy=>false}, {:time=>"17:54", :easy=>false}]},
         "27B BLEIWEISOVA - BTC - LETALIŠKA"=>
          {:route=>"BLEIWEISOVA - BTC - LETALIŠKA",
           :bus_number=>"27B",
           :arrivals=>[{:time=>"23:40", :easy=>false}]},
         "51 POLHOV GRADEC-LJUBLJANA"=>
          {:route=>"POLHOV GRADEC-LJUBLJANA",
           :bus_number=>"51",
           :arrivals=>
            [{:time=>"21:33", :easy=>false},
             {:time=>"05:31", :easy=>false},
             {:time=>"06:19", :easy=>false}]},
         "56 ŠENTJOŠT-LJUBLJANA"=>
          {:route=>"ŠENTJOŠT-LJUBLJANA",
           :bus_number=>"56",
           :arrivals=>
            [{:time=>"22:06", :easy=>false},
             {:time=>"05:15", :easy=>false},
             {:time=>"06:26", :easy=>false}]}}}}

    assert_equal result_hash,
      arrivals
  end

  def test_parsing_single_bus
    response = File.read(File.join(File.dirname(__FILE__), 'response.html'))
    stub_request(:any, /wbus.talktrack.com\/.*/).
      to_return(:body => response, :status => 200,  :headers => { 'Content-Length' => response.length } )

    arrivals = Lpp.arrivals_for_bus('bavarski', 6)
    result_hash = {"600012"=>
      {:name=>"BAVARSKI DVOR",
       :buses=>
        {"6 ČRNUČE - DOLGI MOST"=>
          {:route=>"ČRNUČE - DOLGI MOST",
           :bus_number=>"6",
           :arrivals=>
            [{:time=>"21:25", :easy=>true},
             {:time=>"21:48", :easy=>false},
             {:time=>"22:00", :easy=>false}]},
         "6 ČRNUČE - GARAŽA"=>
          {:route=>"ČRNUČE - GARAŽA",
           :bus_number=>"6",
           :arrivals=>[{:time=>"00:53", :easy=>false}]},
         "6B ČRNUČE - NOTRANJE GORICE"=>
          {:route=>"ČRNUČE - NOTRANJE GORICE",
           :bus_number=>"6B",
           :arrivals=>
            [{:time=>"21:41", :easy=>false},
             {:time=>"22:28", :easy=>true},
             {:time=>"04:47", :easy=>false}]}}},
       "600011"=>
        {:name=>"BAVARSKI DVOR",
         :buses=>
          {"6B NOTRANJE GORICE - GARAŽA"=>
            {:route=>"NOTRANJE GORICE - GARAŽA",
             :bus_number=>"6B",
             :arrivals=>[{:time=>"23:30", :easy=>true}]},
           "6 DOLGI MOST - ČRNUČE"=>
            {:route=>"DOLGI MOST - ČRNUČE",
             :bus_number=>"6",
             :arrivals=>
              [{:time=>"21:45", :easy=>true},
               {:time=>"22:16", :easy=>false},
               {:time=>"23:40", :easy=>false}]},
           "6 DOLGI MOST - GARAŽA"=>
            {:route=>"DOLGI MOST - GARAŽA",
             :bus_number=>"6",
             :arrivals=>
              [{:time=>"22:44", :easy=>false},
               {:time=>"00:52", :easy=>false},
               {:time=>"09:24", :easy=>false}]},
           "6B NOTRANJE GORICE - ČRNUČE"=>
            {:route=>"NOTRANJE GORICE - ČRNUČE",
             :bus_number=>"6B",
             :arrivals=>
              [{:time=>"21:28", :easy=>false},
               {:time=>"21:58", :easy=>true},
               {:time=>"22:31", :easy=>true}]}}}}

    assert_equal result_hash,
      arrivals
  end

  def test_no_station_found
    response = File.read(File.join(File.dirname(__FILE__), 'response_not_found.html'))
    stub_request(:any, /wbus.talktrack.com\/.*/).
      to_return(:body => response, :status => 200,  :headers => { 'Content-Length' => response.length } )

    assert_raise RuntimeError do
      Lpp.arrivals('non-existing-station')
    end
  end
end
