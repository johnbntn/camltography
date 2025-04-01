(* open Owl *)
module Owl_vector = Owl_dense_ndarray_generic

type cypher = int list * int

let dot = List.fold_left2 (fun s x y -> s + x * y) 0

let test_int test sample sd =
  let nom = Float.neg (Owl_maths.pow ((Int.to_float test) -. sample) 2.) in
  let denom = 2. *. (Owl_maths.pow sd 2.) in
  let frac = nom /. denom in
  let prob_accept = Owl_maths.exp frac in
  match Owl_stats.binomial_rvs ~p:prob_accept ~n:1 with
  | 1 -> true
  | _ -> false

let round_power_of_2 n exp = 
  let x = Owl_maths.pow (Int.to_float 2) (Int.to_float exp) in
  let initial_round = Float.round ((Int.to_float n) /. x) in
  Float.to_int x * (Float.to_int initial_round)

let rec generate_noise sd = 
  let cont_sample = Owl_stats.gaussian_rvs ~mu:1. ~sigma:sd in
  let potential_int = Float.to_int (Float.round cont_sample) in
  match test_int potential_int cont_sample sd with
  | true -> potential_int
  | false -> generate_noise sd

let encrypt ~m:m ~s:s a = 
  let noise = generate_noise 3. in
  let product = (dot a s) + (m lsl 28) in
  let obs_product = product + noise in
  (a, obs_product)

let decrypt cypher secret = 
  let a = match cypher with |(a, _) ->  a in 
  let obs = match cypher with |(_, b) -> b in
  let obs_plaintext = obs - (dot secret a) in
  (round_power_of_2 obs_plaintext 28) lsr 28

let add_cyphers c1 c2 =
  let a = match c1 with |(a, _) -> a in
  let obs_pt1 = match c1 with |(_, b) -> b in
  let obs_pt2 = match c2 with |(_, b) -> b in
  let new_obs_pt = obs_pt1 + obs_pt2 in
  (a, new_obs_pt)