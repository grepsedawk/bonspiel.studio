class CreateGames::V20220124011336 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(Game) do
      primary_key id : Int64
      add_timestamps

      add sheet : Int16
      add team_a_score : Int16, default: 0
      add team_b_score : Int16, default: 0
      add team_a_name : String, default: "Team A"
      add team_b_name : String, default: "Team B"
      add team_a_club_name : String?, default: ""
      add team_b_club_name : String?, default: ""
      add team_a_hammer : Bool, default: true
      add final : Bool, default: false
      add presenting : Bool, default: false
      add current_end : Int16, default: 0

      add_belongs_to draw : Draw, on_delete: :cascade
    end

    create_index :games, [:sheet, :draw_id], unique: true
  end

  def rollback
    drop table_for(Game)
  end
end
