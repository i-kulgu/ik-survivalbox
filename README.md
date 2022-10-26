# ik-survivalbox

Create boxes that gives you random / static / lucky items upon opening the box.

( For any help you can reach us at Discord: [Hi-Dev](https://discord.com/invite/pSJPPctrNx) )

# Installation:

- Drag and drop the folder in your resources
- Start the resource
- Enjoy

# Setup

- Copy the images from images folder to [your-inventory]\html\images 

- Add the following items to qb-core\shared\items.lua

```lua
   -- ik-survivalbox
   ['small_survivalbox'] 			 = {['name'] = 'small_survivalbox', 		['label'] = 'Small Survival Box', 		['weight'] = 150, 		['type'] = 'item', 		['image'] = 'small_survivalbox.png', 	['unique'] = false,    ['useable'] = true, 	   ['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Small box of basic items'},
   ['medium_survivalbox'] 			 = {['name'] = 'medium_survivalbox', 		['label'] = 'Medium Survival Box', 		['weight'] = 250, 		['type'] = 'item', 		['image'] = 'medium_survivalbox.png', 	['unique'] = false,    ['useable'] = true, 	   ['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Medium box with commonly needed items'},
   ['big_survivalbox'] 			 	 = {['name'] = 'big_survivalbox', 			['label'] = 'Big Survival Box', 		['weight'] = 350, 		['type'] = 'item', 		['image'] = 'big_survivalbox.png', 		['unique'] = false,    ['useable'] = true, 	   ['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Big box with some rare items'},
   ```

- If you add other boxes then add those too

# Workflow:

- Setup boxes
- Players buy the box or you set it up as starter items box
- Players uses the box and they will get items that are configured

