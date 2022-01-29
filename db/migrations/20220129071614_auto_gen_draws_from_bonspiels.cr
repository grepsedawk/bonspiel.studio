class AutoGenDrawsFromBonspiels::V20220129071614 < Avram::Migrator::Migration::V1
  def migrate
    BonspielQuery.all.each do |bonspiel|
      SaveBonspiel.update!(bonspiel)
    end
  end

  def rollback
    # do nothing
  end
end
