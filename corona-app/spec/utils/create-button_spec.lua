local hasProperty = require("spec.internal.has-property")

local com = require("spec.mocks.common")
local display = require("spec.mocks.display")
local widget = require("spec.mocks.widget")

local libs = {
  com = com,
  display = display,
  widget = widget
}

local createButton = require("utils.create-button")
assert:register("matcher", "has_property", hasProperty)

describe("Testing the create-button function #widget", function()
  local testLabel = "Test Button"
  local handler = spy.new(function() end)
  local newButton = spy.on(widget, "newButton")
  local newGroup = spy.on(display, "newGroup")
  local newRoundedRect = spy.on(display, "newRoundedRect")
  local button = createButton(testLabel, handler, false, libs)

  it("should call the newButton function from the widget library", function ()
    assert.spy(newButton).was.called(1)
  end)

  it("should call the newGroup function from the display library", function ()
    assert.spy(newGroup).was.called(1)
  end)

  it("should call the newRoundedRect function from the display library", function ()
    assert.spy(newRoundedRect).was.called_with(3, 3, com.w - 20, 90, 7)
  end)

  describe("Applies the correct properties to the button widget", function()
    it("should use the label as the label property for the newButton function", function()
      assert.spy(newButton).was.called_with(match.has_property("label", testLabel))
    end)

    it("should use the correct font size based on the small flag", function()
      assert.spy(newButton).was.called_with(match.has_property("fontSize", 32))
      local smallButton = createButton(testLabel, handler, true, libs)
      assert.spy(newButton).was.called_with(match.has_property("fontSize", 24))
    end)

    it("should call the handler on the \"ended\" of click events", function()
      button.items[2].onEvent({ phase = "started" }) -- Mock call to the on started handler with ended event
      assert.spy(handler).was.not_called()

      button.items[2].onEvent({ phase = "ended" }) -- Mock call to the on event handler with ended event
      assert.spy(handler).was.called()
    end)
  end)

end)