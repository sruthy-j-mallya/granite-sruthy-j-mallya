# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ActionView::Helpers::TranslationHelper
  self.abstract_class = true
end
