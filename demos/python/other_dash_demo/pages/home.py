from dash import (
    html,
    register_page,
)  # , callback # If you need callbacks, import it here.

register_page(__name__, name="Home", top_nav=True, path="/")


def layout():
    layout = html.Div(
        [
            html.H1(["Home Page"]),
            html.Button(
                id="my-button",
                n_clicks=0,  # Initialize with zero clicks
                children="Click Me",  # Button label
                style={"fontSize": "20px", "margin": "20px"},
            ),
            html.Div(id="output-container", children="Button not clicked."),
        ]
    )
    return layout
