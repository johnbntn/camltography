let a = [3; 4; 5] in
let secret = [6; 7; 8] in 
let msg = 4 in
let noise = 2 in

let cypher = Lwe.encrypt msg a secret noise in
let original_msg = Lwe.decrypt cypher secret in

Printf.printf "%d\n" original_msg