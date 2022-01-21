class CreateBonspiels::V20220122011439 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(Bonspiel) do
      primary_key id : Int64
      add_timestamps
      add name : String
      add start_at : Time
      add end_at : Time
      add sheets : Int16

      add_belongs_to owner : User, on_delete: :cascade
    end

    create_index :bonspiels, [:owner_id, :name], unique: true
  end

  def rollback
    drop table_for(Bonspiel)
  end
end
