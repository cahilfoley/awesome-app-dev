require("busted")
local hasProperty = require("spec.internal.has-property")

local com = require("spec.mocks.common")
local widget = require("spec.mocks.widget")

local libs = {
   com = com,
   widget = widget
}

local createScrollView = require("utils.create-scroll-view")
assert:register("matcher", "has_property", hasProperty)

describe(
   "Test the creation of a scroll function #widget",
   function()
      local newScrollView = spy.on(widget, "newScrollView")
      local scrollView = createScrollView(libs)

      it(
         "should correctly set the properties of the scroll view widget",
         function()
            assert.spy(newScrollView).was.called_with(match.has_property("backgroundColor", {.87, .87, .87}))
            assert.spy(newScrollView).was.called_with(match.has_property("left", 0))
            assert.spy(newScrollView).was.called_with(match.has_property("top", 100))
            assert.spy(newScrollView).was.called_with(match.has_property("width", com.w))
            assert.spy(newScrollView).was.called_with(match.has_property("height", com.h - 100))
            assert.spy(newScrollView).was.called_with(match.has_property("topPadding", 20))
            assert.spy(newScrollView).was.called_with(match.has_property("bottomPadding", 20))
            assert.spy(newScrollView).was.called_with(match.has_property("horizontalScollDisabled", true))
         end
      )
   end
)
