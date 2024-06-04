class CalcController < ApplicationController
  def square
    render({:template => "res_templates/square"})
  end

  def square_res
    @target_num = params.fetch("num").to_f

    @res = @target_num * @target_num

    render({:template => "res_templates/square_res"})
  end

  def square_root
    render({:template => "res_templates/square_root"})
  end

  def square_root_res
    @target_num = params.fetch("num").to_f
    
    @res = Math.sqrt(@target_num)

    render({:template => "res_templates/square_root_res"})
  end

  def payment
    render({:template => "res_templates/payment"})
  end
  
  def payment_res
    @years_left = params.fetch('years_remaining').to_i
    @apr = params.fetch('apr').to_f
    @pv = params.fetch('present_value').to_f
  
    r = (@apr / 100) / 12
    n = @years_left * 12
  
    numerator = (r * @pv)
    denominator = 1 - ((1 + r) ** -n)
  
    @payment =  numerator / denominator
  
    render({:template => "res_templates/payment_res"})
  end

  
  def random
    render({:template => "res_templates/random"})
  end

  def random_res
    @min = params.fetch('min').to_f 
    @max = params.fetch('max').to_f 
    @rand = rand(@min...@max) 

    render({:template => "res_templates/random_res"})
  end
end
