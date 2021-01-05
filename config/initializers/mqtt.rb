require 'mqtt'
# 读取配置
# conf = YAML.load_file("#{Rails.root}/config/mqtt.yml")[Rails.env]
# 连接服务
# if conf
#   $mqtt = MQTT::Client.connect(:host => conf['host'], :port => conf['port'], :username => conf['username'], :password => conf['password'])
# end
# if $mqtt.present?
#   # 开启线程 避免连接堵塞
#   Thread.new do
#   # 订阅所有topic
#    $mqtt.get('#') do |topic, msg|
#        Rails.logger.debug "topic: #{topic}, msg: #{msg}"
#    end
#   end
# end