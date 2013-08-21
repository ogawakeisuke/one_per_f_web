module ApplicationHelper

  def evalute(actual_val)
    
    expect_val = -0.0001 
    dif = Math.sqrt( (expect_val - actual_val) * (expect_val - actual_val) ) * 2000 
  end

end
