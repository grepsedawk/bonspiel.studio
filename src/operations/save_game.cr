class SaveGame < Game::SaveOperation
  # To save user provided params to the database, you must permit them
  # https://luckyframework.org/guides/database/saving-records#perma-permitting-columns
  #
  permit_columns team_a_score, current_end, team_b_score
  upsert_unique_on :sheet, :draw_id
end
