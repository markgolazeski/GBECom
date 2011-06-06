class Photo < ActiveRecord::Base
  attr_accessible :id, :href, :rating
  validates_presence_of :href

  def calculate_new_rating 
    return
  end

  def k_factor
    k_factor = 25
    if match_count >= 30
      if rating < 2400
        k_factor = 15
      else
        k_factor = 10
      end
    end

    return k_factor
  end

end
