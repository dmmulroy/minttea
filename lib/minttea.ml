open Riot
module Event = Event
module Command = Command
module App = App

let app = App.make

let start app =
  let prog = Program.make ~app ~fps:60 in
  let module App = struct
    let name = "my_app"

    let start () =
      Logger.set_log_level None;
      let pid = spawn_link (fun () -> Program.run prog) in
      Ok pid
  end in
  Riot.start ~apps:[ (module Riot.Logger); (module App) ] ()
