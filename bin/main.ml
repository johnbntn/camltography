let a = [3; 4; 5] in
let secret = [6; 7; 8] in 
let msg = 4 in

let cypher = Lwe.encrypt ~m:msg ~s:secret a in
let original_msg = Lwe.decrypt ~cypher:cypher ~s:secret in

Printf.printf "%d\n" original_msg