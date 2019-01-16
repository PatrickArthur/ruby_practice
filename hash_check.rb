# was asked this in an interview, take two hashes and return a new hash that has
# all keys whose values are not equal in an array, I originallt did the iterative
# approach because in production you rarley use recursion. I came home and did the
# function recursivly

def hash_check(start_hash, end_hash, hash = {})
  key = (start_hash.keys + end_hash.keys).uniq.first
  st = start_hash.first
  ed = end_hash.first

  if start_hash.empty? && end_hash.empty?
    hash
  else
    if st.last.class == Hash && ed.last.class == Hash
      hash2 = {}
      test = hash_check(st.last, ed.last, hash2)
      hash[key] = test
    else
      hash[key] = st.last != ed.last ? [st.last, ed.last] : st.last
      [start_hash, end_hash].each {|x| x.delete(key)}
      hash_check(start_hash, end_hash, hash)
    end
  end
  hash
end

start_hash = {name: "john", age: 29, location: {city: "Albany", state: "MA"}}
end_hash = {name: "mike", age: 28, location: {city: "Brooklyn", state: "NY"}}

puts hash_check(start_hash, end_hash)
