module Components.Details exposing (view, Model, initialModel)
import Html exposing (text, Html, div, a, h1, h2)
import Html.Attributes exposing (class, href)
import Models.Todo as TodoModel

renderModel : TodoModel.Model -> Html a
renderModel model =
  div [class "details"] [
      h1 [] [text model.header],
      div [] [text model.details]
  ]