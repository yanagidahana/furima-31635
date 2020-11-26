class RecordController < ApplicationController

  def index
    @recod = Recod.all
  end
  
end
