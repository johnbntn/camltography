(* 
Things to do:
    - add modulus to make it legit
    - Generate random vector
    - Generate secret key
    - auto gen docs
    - migrate from bin to test
    - use Owl ndarrays instead of arrays
*)

type cypher

val encrypt : m:int -> s:int list -> int list -> cypher
(** Encrypts message passed in as integer. msg -> secret key -> vector -> t*)

val decrypt : cypher -> int list -> int
(** Decrypts cypher with secret key.*)

val add_cyphers : cypher -> cypher -> cypher
(** Add two cyphers together *)
