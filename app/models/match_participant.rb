class MatchParticipant < ApplicationRecord
  belongs_to :match

  enum result: [:win, :lose, :tie]

  def win_rate
    all_participated_times.where(result: :win).count * 1.0 / all_participated_times.count
  end

  def all_participated_times
    MatchParticipant.where(participant: self.participant)
  end

  def versus(opponent)
    own_matches = all_participated_times
    opponent_matches = opponent.all_participated_times
    common_matches = (own_matches.map(&:match_id) & opponent_matches.map(&:match_id)).select do |match_id|
      matches = MatchParticipant.where(match_id: match_id)
      own_team = matches.find_by(participant: self.participant).team
      opponent_team = matches.find_by(participant: opponent.participant).team
      own_team != opponent_team
    end
    win_matches = own_matches.where(result: :win).map(&:match_id) & opponent_matches.where(result: :lose).map(&:match_id)
    lose_matches = own_matches.where(result: :lose).map(&:match_id) & opponent_matches.where(result: :win).map(&:match_id)
    tie_matches_count = common_matches.count - win_matches.count - lose_matches.count

    [win_matches.count, lose_matches.count, tie_matches_count]
  end
end
