module StatusTransitionsHelper
  def options_for_status_transition
    Project.statuses.keys.map {|status| [status.humanize, status] }
  end
end
