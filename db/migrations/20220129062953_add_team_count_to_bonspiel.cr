class AddTeamCountToBonspiel::V20220129062953 < Avram::Migrator::Migration::V1
  def migrate
    alter table_for(Bonspiel) do
      add teams : Int16, fill_existing_with: 32
    end

    alter table_for(Draw) do
      add sequence : Int16, fill_existing_with: 1
    end

    DrawQuery.truncate(cascade: true)

    create_index :draws, [:bonspiel_id, :sequence], unique: true

    make_optional table_for(Draw), :start_at
  end

  def rollback
    alter table_for(Bonspiel) do
      remove :teams
    end
    alter table_for(Draw) do
      remove :sequence
    end
    drop_index :draws, [:bonspiel_id, :sequence]

    make_required table_for(Draw), :start_at
  end
end
