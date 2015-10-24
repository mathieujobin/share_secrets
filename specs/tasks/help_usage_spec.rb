require 'rake'
require 'byebug'

RSpec.describe 'help rake task' do
	before :all do
		Rake.application.init
		Rake.application.load_rakefile
	end

	describe 'help' do
		let :run_rake_task do
			Rake::Task["help"].reenable
			Rake.application.invoke_task "help"
		end

		it "should display a command list" do
			run_rake_task
		end

	end
end

