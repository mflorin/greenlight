require 'greenlight/console'
require 'greenlight/library'
require 'greenlight/request'
require 'greenlight/test'
require 'greenlight/scenario'

module Greenlight
	class LibraryException < StandardError; end

	class Library

		# library name
		attr_accessor :name

		# tests collection
		attr_accessor :tests

		def initialize(name)
			self.name = name
			self.tests = {}
		end

		def run(test, args = {})
			if not self.tests.has_key?(test)
				error "test '#{test}' not found in library '#{self.name}'"
				raise TestException
			else
				tests[test].run(args)
			end
		end

		def test(name, &block)
			tests[name] = Test.new(name, &block)
		end

	end

end