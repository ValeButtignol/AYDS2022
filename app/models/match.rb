class Match < ActiveRecord::Base
  belongs_to :home_team, class_name: 'Team'
  belongs_to :visitor_team, class_name: 'Team'
  has_one :result
  has_many :forecasts
  has_many :administrators

  validates :stadium, :date, :home_team, :visitor_team, :match_type, presence: true
  validates :home_team, comparison: {other_than: :visitor_team}


  after_create do
    matches = Match.all
    octaves = 0
    quarters = 0
    semifinals = 0
    third_fourths = 0
    finals = 0

    matches.each do |m|
      if m.match_type == 'OCTAVES'
        octaves += 1
      elsif m.match_type == 'QUARTERS'
        quarters += 1
      elsif m.match_type == 'SEMI'
        semifinals += 1
      elsif m.match_type == 'THIRD AND FOURTH'
        third_fourths += 1
      elsif m.match_type == 'FINAL'
        finals += 1
      end
    end

    if self.match_type == 'OCTAVES' and octaves > 8
      self.destroy
    elsif self.match_type == 'QUARTERS' and quarters > 4
      self.destroy
    elsif self.match_type == 'SEMI' and semifinals > 2
      self.destroy
    elsif self.match_type == 'THIRD AND FOURTH' and third_fourths > 2
      self.destroy
    elsif self.match_type == 'FINAL' and finals > 1
      self.destroy
    end
  end
end