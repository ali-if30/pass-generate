module  Password_generator

  def menu_print
    puts "What should be include :  "
    puts "Puts your query in 1/0 Format For :"
    puts "Alphabet/Numeric/Specia Charater/Length"
    puts "1 For if you want to include and 0 if dont and at the last length "
    puts "For example : 1/1/0/7 "    
  end 


  def generrate_hash(option)
    option_arr=option.split("/")
    option_hash = {}

    option_hash["alphabet"] = option_arr[0]=="1" ? true : false
    option_hash["numeric"]  = option_arr[1]=="1" ? true : false
    option_hash["special"]  = option_arr[2]=="1" ? true : false
    option_hash["length"]   = option_arr[3].to_i

    return option_hash
  end
  
  def take_dessired_char(option_hash)
    pswd=""
    pswd << (65 + rand(25)).chr.to_s  if option_hash["alphabet"]
    pswd << (48 + rand(9)).chr.to_s if option_hash["numeric"]
    pswd << (33 + rand(15)).chr.to_s if option_hash["special"]
    return pswd 
  end

  def generate_password(option)
    option_hash=generrate_hash(option)
    pswd="" 
    while pswd.length < option_hash["length"] 
      pswd << take_dessired_char(option_hash)
    end 
    return pswd[0,option_hash["length"]] 
  end
end

include Password_generator
puts 
puts " ***Password Generator**** "
menu_print
options_list=gets
pswd=generate_password(options_list).split("").shuffle.join
puts pswd