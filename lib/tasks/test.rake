desc "Task to run both RSpec and Teaspoon tests"
task :test do
  system("rake teaspoon")
  system("rspec")
end
