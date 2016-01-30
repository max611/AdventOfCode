def min_length(str); 8 <= str.length; end
def repeats?(str); str.match(/(\w)\1+.*(\w)\2+/) ? true : false; end
def disallowed?(str); str =~ /[iol]/; end
def consecutive_three?(str)
  r, p, chars = false, 0, str.chars
  while !r && p < (str.length - 2)
    r = chars[p].next == chars[p + 1] && chars[p + 1].next == chars[p + 2]
    p += 1
  end
  return r
end
def pwd_valid?(str)
  min_length(str) && repeats?(str) &&
    !disallowed?(str) && consecutive_three?(str)
end

input = 'hxbxwxba'
while !pwd_valid?(input); input = input.next; end
puts input