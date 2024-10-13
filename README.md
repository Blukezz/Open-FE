# Open Fe
A simple Roblox reanimation hub that uses Krypton Reanimate.

## Usage
To use Open Fe execute the following code in your executor of choice.
```lua
Hats = nil
loadstring(game:HttpGet("https://raw.githubusercontent.com/Blukezz/Open-FE/refs/heads/main/Main.lua"))()
```
If you want to use custom hats then change the "Hats" variable so it looks something like this.
```lua
    Hats = {
		["Right Arm"] = {
			{Texture = "14255544465", Mesh = "14255522247", Name = "RARM", Offset = CFrame.Angles(0, 0, math.rad(90))},
		},

		["Left Arm"] = {
			{Texture = "14255544465", Mesh = "14255522247", Name = "LARM", Offset = CFrame.Angles(0, 0, math.rad(90))},
		},

		["Right Leg"] = {
			{Texture = "17374768001", Mesh = "17374767929", Name = "Accessory (RARM)", Offset = CFrame.Angles(0, 0, math.rad(90))},
		},

		["Left Leg"] = {
			{Texture = "17374768001", Mesh = "17374767929", Name = "Accessory (LARM)", Offset = CFrame.Angles(0, 0, math.rad(90))},
		},	

		["Torso"] = {
			{Texture = "14251599953", Mesh = "14241018198", Name = "Black", Offset = CFrame.identity},
		},
	}
```

## Credits
`xyzkade` Creating Krypton Reanimate (The reanimate used in Open FE.)

## Other Notes
Feel free to use the contents of this repository as a learning resource.

Feel free to drop a pull request if you want to contribute in any way, even adding your own converts!