module Components.List exposing (view)
import Html exposing (text, Html, div, a, ul, li)
import Html.Attributes exposing (class, href)
import Components.Details as ArticleDetails
import Html.Events exposing (onClick)

type alias Model =
  { articles: List ArticleDetails.Model }

type Msg
  = Fetch Int

view : Html Msg
view =
  div [class "list"] [
      ul [] [
          li [] [a [href "www.google.com"] [text "item 1"]],
          li [] [a [href "www.google.com"] [text "item 2"]],
          li [] [a [onClick Fetch] [text "item 3"]]
      ]
  ]