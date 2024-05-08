# WIP charlie-cores
## *Requirements & Features*
>### **Requires **[VORP-Core](https://github.com/VORPCORE/VORP-Core)****
>Currently requires disabling `function FillUpCores()` from `vorp_core/client/miscellanea.lua`

---

### Allows players to receive XP with /giveallXP `amount`
- Based on config.lua and the amount of XP the player has, increases the value of the outer ring for health and stamina.

### Check your current level with /checklevel

### Below is an example of adding the event "charliecores:addallXP" in another resource:
```myresource.lua
-- server.lua --

RegisterServerEvent("myResource:Crafting")
AddEventHandler("myResource:Crafting", function()
-- myResource.lua code here --
-- you can have anything else added here, but below is what will give the player XP --
  local amount = -- INSERT AMOUNT HERE --
  TriggerEvent("charliecores:addallXP", source, amount)
  ```




# WIP:
>- Not having to disable `function FillUpCores()`
>- Changing health/stamina independently
>- Removing unecessary code/prints
