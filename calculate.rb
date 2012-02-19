# stamp values available at:- http://www.royalmail.com/discounts-payment/stamps/prices

class Stamps 

  def self.denominations
	@stamp_denominations = [1, 2, 5, 10, 20, 50, 68, 76, 110, 100, 165, 150, 200, 300, 500, 36, 46 ].sort.reverse
  end


  def self.all
    denominations
  end

  def self.calculate value
	value
	stamps = []
	while value > 0 do
	  denominations.each do |stamp|
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


puts Stamps::calculate(1234)
puts ""
puts Stamps::calculate(293)
