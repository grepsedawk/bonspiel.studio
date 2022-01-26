class SaveDraw < Draw::SaveOperation
  # To save user provided params to the database, you must permit them
  # https://luckyframework.org/guides/database/saving-records#perma-permitting-columns
  #
  permit_columns start_at
  upsert_lookup_columns :bonspiel_id, :start_at

  before_save do
    start_at.value = start_at.value.try do |time|
      time.to_local_in(Time::Location.load("America/Chicago"))
    end
  end
end
