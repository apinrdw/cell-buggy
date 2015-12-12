cell_buggy
===================

Depending on [redpotion#158](https://github.com/infinitered/redpotion/issues/158), there is 2 options to solve this:
- accessing `screen.stylesheet` in `on_load` method for layout on the current screen stylesheet
- appending view in `on_load`, because cell should be the one that is responsible for adding views directly
