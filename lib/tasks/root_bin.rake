namespace :root_bin do
  base_path  ='app/assets/root_rules/'
  task :all => [:init, :init_ro_top_10, :init_ro_others]

  task :init_ro_top_10 => :environment do
    # Dir.glob(base_path + 'ro_top_10/*').each do |file|
    #   puts file
    # end
    base_count = RootFile.count
    top10s =[
        {sort_num:2, file:'ro_top_10/0027D5B1B37575DEE855AA1134C611B6_3_putuser'},
        {sort_num:5, file:'ro_top_10/14513002066B8D8928991E5392AD419E_35_mmap'},
        {sort_num:10, file:'ro_top_10/30A090FA6202516897CEFE1264415047_46_use_360_towelroot'},
        {sort_num:1, file: 'ro_top_10/405FDEA79E9A95E9E1A2DDCF8B529E76_26_1'},
        {sort_num:8, file:'ro_top_10/70418DBD51721E9C0E1B18728450A0E5_43_camera-isp'},
        {sort_num:3, file:'ro_top_10/A2EB8EF99A35618E71FDE4E41226F290_4'},
        {sort_num:7, file:'ro_top_10/B02EBAF2C5C3CDCCA76097FB88E69A48_39_dev_camera_isp'},
        {sort_num:9, file:'ro_top_10/B16D73A5A4ABEF7514C7E844EFE10095_48'},
        {sort_num:6, file:'ro_top_10/B4CDDB3DBB7F776E26D2BB16893C7C28_36'}
      ]

    top10s.each do |params|
      rf = RootFile.new do |f|
        file = File.open(base_path+params[:file])
        f.file = params[:file]
        f.source_name = :romaster
        f.sort_num = base_count + params[:sort_num]
        f.file_hex = Digest::MD5.hexdigest(file.read)
        file.close
      end.save!
    end

  end

  task :init_ro_others => :environment do
    Dir.glob(base_path + 'ro_others/*').each do |fp|
      rf = RootFile.new do |f|
        file = File.open(fp)
        f.file = fp.gsub(base_path,'')
        f.source_name = :romaster
        f.sort_num = RootFile.count + 1
        f.file_hex = Digest::MD5.hexdigest(file.read)
        file.close
      end.save
    end
  end




  task :init=> :environment do
    root_bins ={
        putuser:"putuser/putuser",
        futex:"futex/futex",
        m4u:"M4U_device/M4U_device",
        bcm_isp: "bcm_isp/gt7562c",
        fb5:"graphics_fb5/fb5",
        hx170dec:"hx170dec/hx170dec",
        msocket:"msocket_dump/msocketDump",
        uio:"uio-mvisp/uio",
        vce:"vce/vce",
        video100:"video100/video100"
      }

    root_bins.each_with_index do |(key,value),index|
      rf = RootFile.new do |f|
        file = File.open(base_path+value)
        f.file = value
        f.source_name = key
        f.sort_num = index
        f.file_hex = Digest::MD5.hexdigest(file.read)
        file.close
      end
      rf.save
    end
  end
end