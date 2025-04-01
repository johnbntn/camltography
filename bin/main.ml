let a = [3; 4; 5] in
let secret = [6; 7; 8] in 
let msg1 = 4 in
let msg2 = 2 in

let cypher = Lwe.encrypt ~m:msg1 ~s:secret a in
let cypher2 = Lwe.encrypt ~m:msg2 ~s:secret a in
let new_cypher = Lwe.add_cyphers cypher cypher2 in
let original_msg = Lwe.decrypt new_cypher secret in

Printf.printf "%d\n" original_msg