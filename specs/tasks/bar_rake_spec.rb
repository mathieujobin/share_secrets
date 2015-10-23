#File: spec/tasks/bar_rake_spec.rb
#require 'spec_helper'
require 'rake'
require 'byebug'

RSpec.describe 'foo namespace rake task' do
	before :all do
		#Rake.application.rake_require "tasks/bar"
		#debugger
		Rake.application.init
		Rake.application.load_rakefile
		#Rake::Task.define_task(:environment)
	end

	describe 'foo:bar' do
		before do
			BarOutput.stub(:banner)
			BarOutput.stub(:spit)
		end

		let :run_rake_task do
			Rake::Task["foo:bake_a_bar"].reenable
			Rake.application.invoke_task "foo:bake_a_bar"
		end

		it "should bake a bar" do
			Bar.any_instance.should_receive :bake
			run_rake_task
		end

		it "should bake a bar again" do
			Bar.any_instance.should_receive :bake
			run_rake_task
		end

		it "should output two banners" do
			BarOutput.should_receive(:banner).twice
			run_rake_task
		end

	end
end

