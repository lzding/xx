module ApplicationHelper
  def humanlizer_int param
    param == 0 ? '否' : '是'
  end


  def render_side_nav

    menus = {games: '游戏管理', game_types: '游戏类型管理', companies: '游戏厂商管理'}

    menus.map do |k,v|
      css = k.to_s == controller_name ? {class: 'active'} : {}
      content_tag :li, (link_to v,"/#{k}"), css
    end.join(" ").html_safe
  end
end
