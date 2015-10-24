require 'rake'
#require 'byebug'

RSpec.describe 'download keys rake task' do
	before :all do
		Rake.application.init
		Rake.application.load_rakefile
	end

	describe 'keys:fetch' do
		let :run_rake_task do
			Rake::Task['keys:fetch'].reenable
			Rake.application.invoke_task 'keys:fetch'
		end

		it "should search the key server" do
			run_rake_task
		end

	end
end

