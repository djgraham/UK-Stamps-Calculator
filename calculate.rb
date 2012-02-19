# stamp values available at:- http://www.royalmail.com/discounts-payment/stamps/prices

class Stamps 

  def self.denominations
	@stamp_denominations = [1, 2, 5, 10, 20, 50, 68, 76, 110, 100, 165, 150, 200, 300, 500, 36, 46 ].sort.reverse
  end


  def self.all
    denominations
  end

  def self.calculate value, available_denominations = denominations
	value
	stamps = []
	while value > 0 do
	  available_denominations.each do |stamp|
            if stamp <= value
              stamps << stamp
	      value = value - stamp
	      break # we've found the stamp to search again from the top
            end
	  end
	end
	count_stamps(stamps)
  end

  def self.count_stamps values
    values.uniq.inject([]){|r, i| r << { :stamp => i, :count => values.select{ |b| b == i }.size } }
  end 

end

puts "Stamps test 1"
puts "We have a parcel to post at 293, and we have all stamp denominations available"
puts Stamps::calculate(293)

puts ""
puts "Stamps test 2"
puts "We have a parcel to post at 293, and we have: 1st class stamps (46p), 2nd class (36p), and 1p, 2p, 5p and 10p"
puts Stamps::calculate(293, [1,2,5,10,46,36].sort.reverse)

puts ""
puts "Stamps test 3"
puts "We have 1st class stamps (46p), 2nd class (36p), and 1p, 2p, 5p"
puts Stamps::calculate(293, [1,2,5,46,36].sort.reverse)
