module TasksHelper
  def due_today(tasks)
    tasks.select { |t| t.due_at.nil? || t.due_at.today? }
  end
end
