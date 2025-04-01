(* 
- encrypt
- decrypt

Things to do:
    - Generate noise
    - Generate random vector
    - Generate secret key
    - auto gen docs
    - migrate from bin to test
    - use Owl ndarrays instead of arrays
*)

type t

val encrypt : m:int -> s:int list -> int list -> t
(** Encrypts message passed in as integer. msg -> secret key -> vector -> .*)

val decrypt : cypher:t -> s:int list -> int
(** Decrypts cypher with secret key.*)