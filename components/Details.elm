module Components.Details exposing (view, Model, initialModel)
import Html exposing (text, Html, div, a, h1, h2)
import Html.Attributes exposing (class, href)

type alias Model =
  { header : String, details : String }

initialModel =
  { header= "testHeader", details= "testDetails" }

view : Model -> Html a
view model =
  div [class "details"] [
      h1 [] [text model.header],
      div [] [text model.details]
  ]