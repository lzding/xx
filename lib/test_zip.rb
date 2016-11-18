require 'zip'
require 'digest'
black_list = ['.','..']
def save_file file, data
  File.open(file,'wb') do |f|
    f.write(data)
  end
end


path ='/Users/marvinmin/projects/box_cms/' + ['app','assets','root_rules','ro_top_10.zip'].join('/')
tmp_dir = '/Users/marvinmin/projects/box_cms/app/assets/root_rules/tmp/'
if File.exist? tmp_dir
  Dir.foreach(tmp_dir) do |file|
    puts File.delete tmp_dir+file unless black_list.include? file
  end
else
  Dir.mkdir tmp_dir
end
Zip::File.open(path) do |zip_file|
  zip_file.each do |entry|
    puts "Extracting #{entry.name}"
    content = entry.get_input_stream.read
    new_name =  Digest::MD5.hexdigest(content)
    save_file tmp_dir+new_name, content
  end
end
Dir.mkdir('/Users/marvinmin/projects/box_cms/app/assets/analysis/2015113/64')
dest = '/Users/marvinmin/projects/box_cms/app/assets/analysis/2015113/64/0b71a69803b26448e3d7cd1d35ad8c08.zip'

if File.exist? dest
  File.delete dest
end

input_filenames = Dir.entries(tmp_dir) - black_list
Zip::File.open(dest, Zip::File::CREATE) do |zipfile|
  input_filenames.each do |filename|
    zipfile.add(filename, tmp_dir + '/' + filename)
    # input_filenames.get
  end
    # zipfile.get_output_stream('test') { |os| os.write "myFile contains just this" }
end

#
# def put_into_archive(disk_file_path, io, zip_file_path)
#   io.get_output_stream(zip_file_path) do |f|
#     f.puts(File.open(disk_file_path, 'rb').read)
#   end
# end


