import os
import flask

def _noop_run(self, *args, **kwargs):
    return None

flask.Flask.run = _noop_run

import main

app = main.app

if __name__ == "__main__":
    port = int(os.environ.get("PORT", "8003"))
    app.run(host="0.0.0.0", port=port, debug=False)
