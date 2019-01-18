# was asked this in an interview, take two hashes and return a new hash that has
# all keys whose values are not equal in an array, I originallt did the iterative
# approach because in production you rarley use recursion. I came home and did the
# function recursivly

def hash_check(start_hash, end_hash, hash = {})
  key = (start_hash.keys + end_hash.keys).uniq.first
  st = start_hash.first.last unless start_hash.first.nil?
  ed = end_hash.first.last unless end_hash.first.nil?

  if start_hash.empty? && end_hash.empty?
    hash
  else
    if st.class == Hash && ed.class == Hash
      hash[key] = hash_check(st, ed, {})
    else
      hash[key] = st != ed ? [st, ed] : st
      [start_hash, end_hash].each {|x| x.delete(key)}
      hash_check(start_hash, end_hash, hash)
    end
  end
  hash
end

start_hash = {name: "mike", age: 29, location: {city: "Albany", state: "NY"}}
end_hash = {name: "mike", age: 28, location: {city: "Brooklyn", state: "NY"}}

puts hash_check(start_hash, end_hash)
