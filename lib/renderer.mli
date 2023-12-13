open Riot

val run : fps:int -> unit
val render : Pid.t -> string -> unit
val enter_alt_screen : Pid.t -> unit
val exit_alt_screen : Pid.t -> unit
val shutdown : Pid.t -> unit
