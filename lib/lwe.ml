type t = int * int

let dot = List.fold_left2 (fun s x y -> s + x * y) 0

let rec pow x n =
  match n with
  0 -> 1
  | 1 -> x
  | _ -> if n mod 2 = 0 then
           pow x (n / 2) * pow x (n / 2)
         else
           x * pow x (n / 2) * pow x (n / 2);;

let round_power_of_2 n exp = 
  let x = pow 2 exp in
  let initial_round = Float.round ((Int.to_float n) /. (Int.to_float x)) in
  x * (Float.to_int initial_round)



let encrypt m s a noise = 
  let product = (dot a s) + (m lsl 28) in
  let obs_product = product + noise in
  (a, obs_product)

let decrypt cypher secret = 
  let a = match cypher with |(a, b) ->  a in 
  let obs = match cypher with |(a, b) -> b in
  let obs_plaintext = a - (dot secret obs) in
  Base.round_nearest obs_plaintext 2

