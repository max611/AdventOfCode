require 'digest/md5'

i = 0
hash = ""
key = ""
x = 0

while i < 1 do
	key = "yzbqklnj"+x.to_s
	hash = Digest::MD5.hexdigest(key)
	if hash[0...5] == "00000"
		puts x
		puts hash
		exit
	else
		x += 1
	end

end