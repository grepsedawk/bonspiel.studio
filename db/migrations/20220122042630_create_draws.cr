class CreateDraws::V20220122042630 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(Draw) do
      primary_key id : Int64
      add_timestamps
      add start_at : Time
      add_belongs_to bonspiel : Bonspiel, on_delete: :cascade
    end

    create_index :draws, [:bonspiel_id, :start_at], unique: true
  end

  def rollback
    drop table_for(Draw)
  end
end
