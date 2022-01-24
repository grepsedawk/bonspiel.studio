class SaveDraw < Draw::SaveOperation
  # To save user provided params to the database, you must permit them
  # https://luckyframework.org/guides/database/saving-records#perma-permitting-columns
  #
  permit_columns start_at
  upsert_lookup_columns :bonspiel_id, :start_at
end
