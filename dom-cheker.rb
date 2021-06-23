require 'httparty'
require 'colorize'
require 'uri'
str = <<END
       
     
                ╭━━━╮╱╱╱╱╱╭━━━╮
                ╰╮╭╮┃╱╱╱╱╱┃╭━╮┃
                ╱┃┃┃┣━━┳╮╭┫╰━━┳━━┳━━┳━╮
                ╱┃┃┃┃╭╮┃╰╯┣━━╮┃╭━┫╭╮┃╭╮╮
                ╭╯╰╯┃╰╯┃┃┃┃╰━╯┃╰━┫╭╮┃┃┃┃
                ╰━━━┻━━┻┻┻┻━━━┻━━┻╯╰┻╯╰╯              
                        z3n70  
       

END
puts str.yellow
puts "Enter List Domain Example subdomain-list.txt"
puts
file = gets.chomp
puts
data_file = File.open("#{file}", "r").read
data1 = data_file.split("\n")

data1.each do |line|

      newuri = URI::HTTP.build({:host => "#{line}"})
      response = HTTParty.get("#{newuri}", timeout: 5)
   
        case response.code 
            when 200
                puts "OK           <= #{newuri}".yellow
            when 404
                puts "Not Found    <= #{newuri}".blue
            when 403
                puts "forbidden    <= #{newuri}".red
            when 400
                puts "bad request  <= #{newuri}".green
            when 500 
                puts "server error <= #{newuri}".blue
            when 408 
                puts "time out     <= #{newuri}".blue
            when 302 
                puts "Found        <= #{newuri}".green
            end
        rescue
        # if response.code
    #     output = File.open("hasil.txt", "w")
    #     output << "#{newuri}"
    #     output.close
    
end
