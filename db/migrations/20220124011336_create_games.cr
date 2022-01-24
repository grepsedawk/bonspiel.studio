class CreateGames::V20220124011336 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(Game) do
      primary_key id : Int64
      add_timestamps

      add sheet : Int16

      add_belongs_to draw : Draw, on_delete: :cascade
    end

    create_index :games, [:sheet, :draw_id], unique: true
  end

  def rollback
    drop table_for(Game)
  end
end
