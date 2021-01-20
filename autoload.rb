# frozen_string_literal: true

require 'faker'
require 'yaml'
require 'pry'

require_relative './modules/uploader'
require_relative './modules/errors'
require_relative './modules/validator'

require_relative './entities/author'
require_relative './entities/book'
require_relative './entities/reader'
require_relative './entities/order'
require_relative './entities/library'
