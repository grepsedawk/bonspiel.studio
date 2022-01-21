class AddPresentingGameToUsers::V20220127172323 < Avram::Migrator::Migration::V1
  def migrate
    alter table_for(Bonspiel) do
      add_belongs_to presenting_game : Game?, on_delete: :nullify
    end

    alter table_for(Game) do
      remove :presenting
    end
  end

  def rollback
    alter table_for(Bonspiel) do
      remove :presenting_game_id
    end
    alter table_for(Game) do
      add presenting : Bool, default: false
    end
  end
end
