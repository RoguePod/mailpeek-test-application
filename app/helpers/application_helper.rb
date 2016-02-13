# Public: ApplicationHelper
module ApplicationHelper
  # Public: determines what type of css class to use for the type of alert
  # passed in.
  #
  # type - the type of alert that will be displayed
  #
  # Examples
  #
  #   flash_class('alert')
  #   # => 'alert-danger'
  #
  #   flash_class('notice')
  #   # => 'alert-success'
  #
  # Returns a string of the type of alert css class to display
  def flash_class(type)
    if type == 'alert'
      'alert-danger alert-dismissible'
    else
      'alert-success alert-dismissible'
    end
  end
end
