module Components.NewTodo exposing (..)

import Messages.TodoMsg exposing (Msg)
import Html exposing (text, Html, div, a, ul, li, input, button)
import Html.Attributes exposing (class, href, type_, value, placeholder)
import Html.Events exposing (onClick, onInput)


view : String -> Html Msg
view todoContent =
    div []
        [ input [ type_ "text", placeholder "Enter your todo here", value todoContent, onInput Messages.TodoMsg.EditContent ]
            []
        , button [ onClick Messages.TodoMsg.AddTodo ] [ text "add" ]
        ]
