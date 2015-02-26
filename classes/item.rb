require 'describable'
require 'securerandom'

class Item

  attr_reader :id
  attr_accessor :response_narratives

  include Describable

  def initialize description = 'There is a simple thing.'
    self.add_description description unless description.nil?
    @id = SecureRandom.hex(8) # if you want to keep track of your item, use a higher class. or find a way to give it an id.

    @response_narratives = {
      :any => 'Nothing happens.'
    }


  end

end