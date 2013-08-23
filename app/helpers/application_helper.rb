module ApplicationHelper

  def evalute(actual_val)
    expect_val = -0.0001 
    dif = Math.sqrt( (expect_val - actual_val) * (expect_val - actual_val) ) * 9000 
  end

  def to_rad(val)
    Math.atan(val) * (180 / Math::PI)
  end

end
