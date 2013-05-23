# Lpp

Lpp is a simple gem for getting bus arrivals in Ljubljana. It uses the wbus.talktrack.com website.

## Installation

Add this line to your application's Gemfile:

    gem 'lpp'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lpp

## Usage examples

If you query Lpp to get arrivals from the main bus station in Ljubljana, Bavarski dvor:

    Lpp.arrivals('bavarski')

You'll be returned a hash similar to this:

    {"600012"=>
      {:name=>"BAVARSKI DVOR",
       :buses=>
        {"1N BROD - BAVARSKI DVOR"=>
          {:route=>"BROD - BAVARSKI DVOR",
           :bus_number=>"1N",
           :arrivals=>
            [{:time=>"02:59", :easy=>false},
             {:time=>"03:24", :easy=>false},
             {:time=>"04:05", :easy=>false}]},
         "3 LITOSTROJ - RUDNIK"=>
          {:route=>"LITOSTROJ - RUDNIK",
           :bus_number=>"3",
           :arrivals=>[{:time=>"21:01", :easy=>false}]},
         "3L BAVARSKI DVOR - TOVARNA LEK"=>
          {:route=>"BAVARSKI DVOR - TOVARNA LEK",
           :bus_number=>"3L",
           :arrivals=>[{:time=>"21:25", :easy=>false}]},
         "3N KOFLJICA - BAVARSKI DVOR"=>
          {:route=>"KOFLJICA - BAVARSKI DVOR",
           :bus_number=>"3N",
           :arrivals=>[{:time=>"21:37", :easy=>false}]}}},
     "600011"=>
      {:name=>"BAVARSKI DVOR",
       :buses=>
        {"1N VIMARJE - BAVARSKI DVOR"=>
          {:route=>"VIMARJE - BAVARSKI DVOR",
           :bus_number=>"1N",
           :arrivals=>[{:time=>"22:55", :easy=>false}]},
         "2 NOVE JARE - ZELENA JAMA"=>
          {:route=>"NOVE JARE - ZELENA JAMA",
           :bus_number=>"2",
           :arrivals=>
            [{:time=>"21:30", :easy=>true},
             {:time=>"21:47", :easy=>false},
             {:time=>"21:58", :easy=>false}]}}}}

You can also get arrivals only for a specific bus number:

    Lpp.arrivals_for_bus('bavarski', 6)

And you'll get only the arrivals that match bus number 6 (6, 6B, etc.)

    {"600012"=>
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

That's it.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
