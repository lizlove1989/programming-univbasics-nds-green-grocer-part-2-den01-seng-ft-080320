require_relative './part_1_solution.rb'

def apply_coupons(cart, coupons)
  cart.each_with_index do |grocery, index|
    groceryName = grocery[:item]
    groceryCount = grocery[:count]
    coupon = coupons[index]
    couponName = coupon ? coupon[:item] : nil

    countToApply = coupon ? coupon[:num] : nil
    
    if groceryName ==  couponName
      if groceryCount > countToApply
        remainder = 0
        itWithDiscount = {}
        
        remainder = groceryCount % countToApply
        countWithDiscount = groceryCount - remainder
        
        grocery[:count] = remainder
        
        itemWithDiscount = {
          :item => "#{groceryName} W/COUPON",
          :price => coupon[:cost] / countWithDiscount,
          :clearance => "true",
          :count => countWithDiscount
        }
        cart << itemWithDiscount
      end
    end
  end
  cart
end

def apply_clearance(cart)
  cart.each do |item, details|
    if cart[item][:clearance] == true
      cart[item][:price] = (cart[item][:price]*0.20 - total)
    end
  end
  cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
