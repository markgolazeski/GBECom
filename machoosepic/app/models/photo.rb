class Photo < ActiveRecord::Base
  attr_accessible :id, :href, :rating, :match_count
  validates_presence_of :href

  alias_attribute :rating, :elo_rating

  def set_new_calculated_rating actual_win, other_rating
    my_rating = self.rating
    my_new_rating = my_rating + self.k_factor * (actual_win - (1.0 / (1 + 10 ** ((other_rating - my_rating) / 400.0))))
    my_new_rating = my_new_rating.ceil

    self.rating = my_new_rating
    self.save!
    return my_new_rating
  end

  def k_factor
    k_factor = 25
    if self.match_count >= 30
      if self.rating < 2400
        k_factor = 15
      else
        k_factor = 10
      end
    end

    return k_factor
  end

end
