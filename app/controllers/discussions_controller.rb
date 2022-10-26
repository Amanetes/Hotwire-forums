# frozen_string_literal: true

class DiscussionsController < ApplicationController
  before_action :authenticate_user!
  def index
    @discussions = Discussion.all
  end
end
