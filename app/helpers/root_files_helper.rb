module RootFilesHelper


  def render_count count
    style = 'progress-bar-default'
    style = 'progress-bar-success' if count > 0
    "<span class=\"badge #{style}\">#{count}</span>".html_safe
  end
  def info_class cond, category
    cond != category ? "btn btn-default" : "btn btn-info"
  end

  def category_name root_file

    if root_file && root_file.category
      RootFile::CATEGORIES.key(root_file.category)
    else
      '没有指定方案类型'
    end
  end

  def categories_for_select
    RootFile::CATEGORIES.map{|c| c}
    end
  def pie_for_select
    RootFile::PIES.map{|c| c}
  end

  def channel_types
    ct = ChannelType.all
    ct.map{|x| [x.name,x.id]}
  end
end
