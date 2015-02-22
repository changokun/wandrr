require 'describable'

class Door

  include Describable

  def initialize
    @this_side_location_id
    @other_side_location_id
    @this_side_state = :shut # :open :ajar :cracked
    # @other_side_state ha ha who cares?
  end

end