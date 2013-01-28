require 'rubygems'
require 'serialport'
require "net/https"
require 'json'

def api_request(opts={})
  o = {
    :host => '',
    :port => '443',
    :path => '',
    :auth => false,
    :headers => false
  }.merge(opts)

  http = Net::HTTP.new(o[:host], o[:port])
  if o[:ssl]
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  end
  req =  Net::HTTP::Get.new(o[:path])
  if o[:auth] then req.basic_auth(o[:auth][:user], o[:auth][:pass]) end
  if o[:headers]
    o[:headers].each do |k,v|
      req[k] = v
    end
  end
  http.request(req)
end

def serial(alert)
  port_str = "/dev/tty.usbmodem12341"
  baud_rate = 9600

  sp = SerialPort.new(port_str, baud_rate)
  sp.write alert

  i = false
  while i == false do
     i = sp.gets.chomp
     puts i
  end
  sp.close
end

def check_splunk
  opts = {
    :ssl => true,
    :host => "",
    :port => 8089,
    :path => "/services/alerts/fired_alerts?output_mode=json",
    :auth => { :user => "", :pass => "" }
  }
  res = JSON.parse(api_request(opts).body)
end

def check_pager_duty
  opts = {
    :ssl => true,
    :host => "",
    :port => 443,
    :path => "/api/v1/incidents/count?status=triggered,acknowledged",
    :headers => { "Content-Type" => "application/json", "Authorization" => "Token token="}
  }
  res = JSON.parse(api_request(opts).body)
end

def check_sensu
  opts = {
    :host => "",
    :port => "",
    :path => "/events",
  }
  res = JSON.parse(api_request(opts).body)
end

def check_status
  alert = 1
  sensu = check_sensu
  if sensu.count > 0 then alert = alert + 4 end
  pd = check_pager_duty
  if pd["total"] > 0 then alert = alert + 3 end
  splunk = check_splunk
  if splunk["entry"][0]["content"]["triggered_alert_count"] > 0 then alert = alert + 2 end

  case alert
  when 1
    serial('1')
  when 3
    serial('2')
  when 4
    serial('3')
  when 5
    serial('4')
  when 6
    serial('5')
  when 7
    serial('6')
  when 8
    serial('7')
  when 10 
    serial('8')
  end
end

while true do
  check_status
  sleep(60)
end
