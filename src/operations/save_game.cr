class SaveGame < Game::SaveOperation
  # To save user provided params to the database, you must permit them
  # https://luckyframework.org/guides/database/saving-records#perma-permitting-columns
  #
  # permit_columns column_1, column_2
  upsert_unique_on :sheet, :draw_id
end
