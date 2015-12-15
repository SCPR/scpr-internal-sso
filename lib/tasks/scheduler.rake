task :scheduler => [:environment] do
  scheduler = Rufus::Scheduler.new

  # Every 10 minutes, run a cleanup
  scheduler.every '10m' do |job|
    Rake::Task['casino:cleanup:all'].invoke
  end

  # Go!
  puts "Scheduler running."
  scheduler.join
end