namespace :s3 do

  task :all => [:upload_componements, :upload_root_file, :upload_plugin, :upload_ref]

  @s3 = Aws::S3::Resource.new(region:'ap-southeast-1',
                             credentials: Aws::Credentials.new('AKIAIAKDM6RWNFMPWEQA',
                                                               'ibB2u4QVMcQEt9ZM79Qzmbaa+rpw/lqxv0AEQJbg'))
  #
  # @s3 = Aws::S3::Resource.new(region:'ap-southeast-1',
  #                            credentials: Aws::Credentials.new('AKIAIKDZIM4NEGXPQUJQ',
  #                                                              '2bfNLsD2rxuC4cQyGDWYnznjNOI9Nv7l6PZRkVYG'))

  base_path = Rails.root.join 'public'

  task :upload_componements => :environment do
    puts 'Uploading componements......'
    Component.all.each do |p|
      puts "uploading:" + p.file.to_s
      upload_file p.file,base_path.to_s +  p.file.to_s
    end
  end

  task :upload_root_file => :environment do
    puts 'Uploading root files......'
    RootFile.all.each do |p|
      puts "uploading:" + p.file.to_s
      upload_file p.file,base_path.to_s +  p.file.to_s
    end
  end

  task :upload_plugin => :environment do
    puts 'Uploading plugin files......'
    Plugin.all.each do |p|
      puts "uploading:" + p.file_path.to_s
      upload_file p.file_path,base_path.to_s +  p.file_path.to_s
    end
  end

  task :upload_ref => :environment do
    puts 'Uploading ref files......'
    Ref.all.each do |p|
      puts "uploading:" + p.exec_file.to_s
      upload_file p.exec_file,base_path.to_s +  p.exec_file.to_s
    end
  end


  def upload_file(file_path,local_path)
    obj = @s3.bucket('cunchutong').object(file_path.to_s.sub '/','')
    obj.upload_file(local_path, acl:'public-read')
    puts "访问链接:#{obj.public_url}"
  end



end