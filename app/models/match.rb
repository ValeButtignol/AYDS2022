class Match < ActiveRecord::Base
  belongs_to :home_team, class_name: 'Team'
  belongs_to :visitor_team, class_name: 'Team'
  has_one :result
  has_many :forecasts
  has_many :administrators

  validates :stadium, :date, :home_team, :visitor_team, :match_type, presence: true
  validates :home_team, comparison: { other_than: :visitor_team }

  # rubocop:disable Metrics/BlockLength
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

    if match_type == 'OCTAVES' and octaves > 8
      destroy
    elsif match_type == 'QUARTERS' and quarters > 4
      destroy
    elsif match_type == 'SEMI' and semifinals > 2
      destroy
    elsif match_type == 'THIRD AND FOURTH' and third_fourths > 1
      destroy
    elsif match_type == 'FINAL' and finals > 1
      destroy
    end
  end
  # rubocop:enable Metrics/BlockLength
end
