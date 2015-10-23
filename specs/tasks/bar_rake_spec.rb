#File: spec/tasks/bar_rake_spec.rb
#require 'spec_helper'
require 'rake'
#require 'byebug'

RSpec.describe 'foo namespace rake task' do
	before :all do
		Rake.application.init
		Rake.application.load_rakefile
	end

	describe 'foo:bar' do
		before do
			allow_any_instance_of(BarOutput).to receive(:banner).and_return(false)
			allow_any_instance_of(BarOutput).to receive(:spit).and_return(false)
		end

		let :run_rake_task do
			Rake::Task["foo:bake_a_bar"].reenable
			Rake.application.invoke_task "foo:bake_a_bar"
		end

		it "should bake a bar" do
			expect_any_instance_of(Bar).to receive(:bake).and_return(:return_value)
			run_rake_task
		end

		it "should bake a bar again" do
			expect_any_instance_of(Bar).to receive(:bake).and_return(:return_value)
			run_rake_task
		end

		it "should output two banners" do
			expect(BarOutput).to receive(:banner).twice
			run_rake_task
		end

	end
end

