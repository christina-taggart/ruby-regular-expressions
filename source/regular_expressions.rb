# Determine whether a string contains a Social Security number.
def has_ssn?(string)
  match = string.match(/\d{3}-\d{2}-\d{4}/)
  if match != nil
    return true
  else
    return false
  end
end

puts "has_ssn? returns true if it has what looks like a SSN"
puts has_ssn?("please don't share this: 234-60-1422") == true

puts "has_ssn? returns false if it doesn't have a SSN"
puts has_ssn?("please confirm your identity: XXX-XX-1422") == false


# Return the Social Security number from a string.
def grab_ssn(string)
  match = string.slice(/\d{3}-\d{2}-\d{4}/)
  return match
end


puts "grab_ssn returns an SSN if the string has an SSN"
puts grab_ssn("please don't share this: 234-60-1422") == "234-60-1422"

puts "grab_ssn returns nil if it doesn't have a SSN"
puts grab_ssn("please confirm your identity: XXX-XX-1422") == nil


# Return all of the Social Security numbers from a string.
def grab_all_ssns(string)
  match = string.scan(/(\d{3}-\d{2}-\d{4})/)
  return match.flatten
end

puts "grab_all_ssns returns all SSNs if the string has any SSNs"
puts grab_all_ssns("234-60-1422, 350-80-0744, 013-60-8762") == ["234-60-1422", "350-80-0744", "013-60-8762"]

puts "grab_all_ssns returns an empty Array if it doesn't have any SSNs"
puts grab_all_ssns("please confirm your identity: XXX-XX-1422") == []


# Obfuscate all of the Social Security numbers in a string. Example: XXX-XX-4430.
def hide_all_ssns(string)
  return string.gsub(/\d{3}-\d{2}/, "XXX-XX")
end

puts "hide_all_ssns obfuscates any SSNs in the string"
puts hide_all_ssns("234-60-1422, 350-80-0744, 013-60-8762") == "XXX-XX-1422, XXX-XX-0744, XXX-XX-8762"

puts "hide_all_ssns does not alter a string without SSNs in it"
string = "please confirm your identity: XXX-XX-1422"
puts hide_all_ssns(string) == string


# Ensure all of the Social Security numbers use dashes for delimiters.
# Example: 480.01.4430 and 480014430 would both be 480-01-4430.
def format_ssns(string)
  p string.gsub(/(\d{3}).?(\d{2}).?(\d{4})/, '\1-\2-\3')
end

puts "format_ssns finds and reformat any SSNs in the string"
puts format_ssns("234601422, 350.80.0744, 013-60-8762") == "234-60-1422, 350-80-0744, 013-60-8762"

puts "format_ssns does not alter a string without SSNs in it"
string = "please confirm your identity: 44211422"
puts format_ssns(string) == string