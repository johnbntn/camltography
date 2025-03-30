(* 
- encrypt
- decrypt
*)

type t

val encrypt : int -> int list -> int list -> int -> t

val decrypt : t -> int list -> int