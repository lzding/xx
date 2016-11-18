### This is the Read me file


Be sure to have a copy of the Bootstrap stylesheet available on your
  application, you can get it on http://getbootstrap.com/.

  Inside your views, use the 'simple_form_for' with one of the Bootstrap form
  classes, '.form-horizontal' or '.form-inline', as the following:

    = simple_form_for(@user, html: { class: 'form-horizontal' }) do |form|
    
    
    
#### how to generate the table with exist table
rails generate scaffold company title:string picture:string --skip-migration

#### Reference Docs:

https://github.com/seyhunak/twitter-bootstrap-rails
rails g scaffold Post title:string description:text
rake db:migrate
rails g bootstrap:themed Posts



http://getbootstrap.com/css/#buttons
https://github.com/carrierwaveuploader/carrierwave
http://m.ggzs.me/game/detail/762fce5f.html


rails generate scaffold game_type title:string picture:string type:integer --skip-migration

export LC_ALL=zh_CN.UTF_8


https://github.com/mperham/sidekiq/wiki/Monitoring
http://ruby-journal.com/how-to-integrate-sidekiq-with-activejob/

RAILS_ENV=production bundle exec rake data_init:download_image_from_remote
RAILS_ENV=production bundle exec rails c
bundle exec sidekiq  -C config/sidekiq.yml -d -e production
https://github.com/mperham/sidekiq/wiki/Monitoring

#### Upload API usage sample:
curl -H "Content-Type: application/json" -X POST -d '{"game":{"title":"test api","remote_icon_url":"http://img01.muzhiwan.com//screen/000/07/89/72/screenhot_1_m.jpg","game_images":["http://7xleal.com2.z0.glb.qiniucdn.com/558f4509aaec69be4affc0b1abfa4db5","http://7xleal.com2.z0.glb.qiniucdn.com/1930760a52a43c60cd2dd0311b8a3838","http://7xleal.com2.z0.glb.qiniucdn.com/4c24ead32462850dab746893830ddc4d"],"game_detail":{"crack_info":"Wow TP","content":"this is the content part"}}}'  http://localhost:3000/api/v1/games