open Minttea

type model = { altscreen : bool; quitting : bool }

let init _ = Command.Noop
let initial_model () = { altscreen = false; quitting = false }

let update event model =
  match event with
  | Event.KeyDown ("q" | "esc" | "ctrl+c") ->
      ({ model with quitting = true }, Command.Quit)
  | Event.KeyDown "space" ->
      let cmd =
        if model.altscreen then Command.Exit_alt_screen
        else Command.Enter_alt_screen
      in
      ({ model with altscreen = not model.altscreen }, cmd)
  | _ -> (model, Command.Noop)

let view model =
  if model.quitting then "Bye!\n"
  else
    let mode = if model.altscreen then "altscreen" else "inline" in
    let help = "  space: switch modes • q: exit\n" in
    Format.sprintf "\n\n You're in %s mode\n\n\n%s" mode help

let () = Minttea.app ~init ~initial_model ~update ~view () |> Minttea.start
