class ListsController < ApplicationController
  def list
    @lists = List.all
  end
end
