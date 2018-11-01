require("busted")

local hasProperty = require("spec.internal.has-property")

local com = require("spec.mocks.common")
local native = require("spec.mocks.native")

local libs = {
   com = com,
   native = native
}

local createSearchField = require("utils.create-search-field")
assert:register("matcher", "has_property", hasProperty)
 --

--[[
   Creates a text field for searching
      @param {table} - A table of three different event handlers
         * onBegan() - User begins editing the field
         * onSubmit(text) - Output resulting text from
         * onChange(text) - Text value has changed
      @param {string} placeholder - A placeholder value when the field is empty
      @param {table} [libs] - The libraries to use, if a library is not provided then it will be imported (for testing)
      @return {TextField} - The native text field
]] describe(
   "Testing the create-search-field function #widget",
   function()
      local onBegan = spy.new(
         function()
         end
      )
      local onChange = spy.new(
         function()
         end
      )
      local onSubmit = spy.new(
         function()
         end
      )
      local handers = {
         onBegan = onBegan,
         onChange = onChange,
         onSubmit = onSubmit
      }
      local newTextField = spy.on(native, "newTextField")
      local placeholder = "Test Search"
      local textField = createSearchField(handers, placeholder, libs)

      it(
         "Checks that placeholder is empty",
         function()
            assert.are.same(placeholder, textField.text)
         end
      )

      it(
         "Creates a text field for searching database",
         function()
            assert.spy(newTextField).was.called_with(com.centerX, com.centerY, com.w - 20, 40)
         end
      )

      it(
         "should call handlers when text field is interacted with",
         function()
            -- Mock events firing
            textField.eventHandlers.userInput({phase = "began"})
            assert.spy(onBegan).was.called()

            textField.eventHandlers.userInput({phase = "editing"})
            assert.spy(onChange).was.called()

            textField.eventHandlers.userInput({phase = "submitted"})
            assert.spy(onSubmit).was.called()
         end
      )
   end
)
