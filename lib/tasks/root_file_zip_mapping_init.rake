namespace :zip_file do

  task :init_data => :environment do
    puts 'start...'
    RootFile.limit(5).each do |f|
      f.zip_file_mappings.destroy_all
      if f.file.current_path.end_with? '.zip'
        puts "deal....zip....#{ f.id}"
        deal_zip_file(f)
      else
        deal_normal_file(f)
        puts "deal....normal....#{ f.id}"
      end
    end
  end

  private
  def deal_normal_file(f)
    create_zip_file(f.file_hex,f.id)
  end

  def deal_zip_file f
    Zip::File.open(f.file.current_path) do |zip_file|
      zip_file.each do |entry|
        create_zip_file(entry.name,f.id)
      end
    end rescue nil
  end

  def create_zip_file(file_md5,id)
    ZipFileMapping.create!(root_file_md5: file_md5,root_file_id:id)
  end
end