class Response

  attr_reader :responder, :method, :narrative
  
  def initialize responder, method, narrative = nil
    @responder = responder
    @method = method
    @narrative = narrative
  end

end