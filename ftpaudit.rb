require 'net/ftp'
require 'fileutils'


CONTENT_SERVER_DOMAIN_NAME = HOST
CONTENT_SERVER_FTP_LOGIN = USERNAME
CONTENT_SERVER_FTP_PASSWORD = PASSWORD

files = Array.new
Net::FTP.open(CONTENT_SERVER_DOMAIN_NAME, CONTENT_SERVER_FTP_LOGIN, CONTENT_SERVER_FTP_PASSWORD) do |ftp|
  ftp.list("/directories/") do |f| #looks in directories folder in root
    files << f.match(/:\d\d\s(.*)$/)[1] #regex to only return the filename
  end
  File.open("host.txt","w+") do |f|
    files.each {|x| f.puts(x)}
  end
end
FileUtils.mv('host.txt','C:\\Users\\gfranchini\\Desktop')

local = Array.new
Dir.chdir('C:\\Users\\gfranchini\\Desktop\\directories')
Dir['*'].each do |x|
    local << x
    local.sort!
	File.open("local.txt", "w+") do |f|
		local.each {|x| f.puts(x)}
	end
end
FileUtils.mv('local.txt','C:\\Users\\gfranchini\\Desktop') #moves file to Desktop (windows)

audit = Array.new
audit = files - local

File.open("audit.txt", "w+") do |f|
  audit.each {|x| f.puts x}
end
FileUtils.mv('audit.txt','C:\\Users\\gfranchini\\Desktop')
