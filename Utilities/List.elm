module Utilities.List exposing (..)


type alias RecordWithID a =
    { a | id : Int }


maxId : List (RecordWithID a) -> Int
maxId list =
    list |> List.map (.id) |> List.maximum |> Maybe.withDefault -1
