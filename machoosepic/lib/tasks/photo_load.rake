# Usage: DIR='/images/test_photos' OWNER='Mark Golazeski' rake photo:load
# Will just load photos that don't exist in DB
namespace :photo do

  task :load => :environment do
    long_dir = File.join(RAILS_ROOT, 'public', ENV['DIR']).to_s
    dir = ENV['DIR']
    owner = ENV['OWNER'] || 'Unknown'
    Dir.foreach(long_dir) do |file|
      if file[0,1] != "."
        filename = [dir, file].join('/')
        if Photo.where(:href => filename).count == 0 
          puts "Importing #{filename}..."
          new_photo = Photo.new(:href => filename, :owner => owner)
          new_photo.save!
        end
      end
    end
  end
end
