class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def show
    @lists = List.show
  end

  def create
    @list = List.new
    @list = List.save
  end
end
