class SaveGame < Game::SaveOperation
  # To save user provided params to the database, you must permit them
  # https://luckyframework.org/guides/database/saving-records#perma-permitting-columns
  #
  permit_columns team_a_score,
    team_b_score,
    team_a_name,
    team_b_name,
    team_a_club_name,
    team_b_club_name,
    current_end
  upsert_unique_on :sheet, :draw_id
end
