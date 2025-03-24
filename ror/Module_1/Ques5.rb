require 'ipaddr'

def ip_class(i)
    begin
        ip = IPAddr.new(i)
        octate = i.split('.').first.to_i

        case octate
        when 1...126
            "Class A"
        when
            128...191
            "Class B"
        when
            192...223
            "Class C"
        when
            224...239
            "Class D(Multicast)"
        when
            240...255
            "Class E (Experimental)"
        end
        
        rescue IPAddr::InvalidAddressError
            "Invalid IP address format"
        end
    end
    print "Enter an IP address"
    ip_ad = gets.chomp

    puts "The IP Address #{ip_ad} belongs to #{ip_class(ip_ad)}"