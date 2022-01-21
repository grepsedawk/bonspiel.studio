class SaveBonspiel < Bonspiel::SaveOperation
  # To save user provided params to the database, you must permit them
  # https://luckyframework.org/guides/database/saving-records#perma-permitting-columns
  #
  permit_columns name, start_at, end_at, sheets, presenting_game_id

  before_save do
    start_at.value = start_at.value.try do |time|
      time.to_local_in(Time::Location.load("America/Chicago")).at_beginning_of_day
    end
    end_at.value = end_at.value.try do |time|
      time.to_local_in(Time::Location.load("America/Chicago")).at_end_of_day
    end
  end
end
