type storage = nat

(* variant defining pseudo multi-entrypoint actions *)

type action =
  | Add of storage
  | Multiply of storage

let add (a: storage) (b: nat): storage = a + b

let multiply (a: storage) (b: nat): storage = a * b

let main(p, storage : action * storage) =
  let storage =
    match p with
    | Add n -> add storage n
    | Multiply n -> multiply storage n
  in (([] : operation list), storage)
