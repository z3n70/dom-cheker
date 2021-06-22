require 'httparty'
require 'colorize'
require 'uri'
str = <<END
        =======================================

        ╔═╗┬ ┬┌┐ ┌┬┐┌─┐  ╔═╗┬ ┬┌─┐┌─┐┬┌─┌─┐┬─┐
        ╚═╗│ │├┴┐ │││ │  ║  ├─┤├┤ │  ├┴┐├┤ ├┬┘
        ╚═╝└─┘└─┘─┴┘└─┘  ╚═╝┴ ┴└─┘└─┘┴ ┴└─┘┴└─
                         
        =======================================


END
puts str.yellow
puts "Enter List Domain"
puts 
puts "Example subdomain-list.txt"
puts 

file = gets.chomp

data_file = File.open("#{file}", "r").read
data1 = data_file.split("\n")
data1.each do |line|
newuri = URI::HTTP.build({:host => "#{line}"})
response = HTTParty.get("#{newuri}")
case response.code
    when 100...200
        puts "#{newuri} || Information "
    when 200...300
        puts "#{newuri} || OK"
    when 300...400
        puts "#{newuri} || Redirect"
    when 400...500
        puts "#{newuri} || Not Found"
    when 500...600
        puts "#{newuri} || Server Error"
    end
end
       
  