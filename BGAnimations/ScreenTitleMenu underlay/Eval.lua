
local zoomFactor = 480 / 2160

local failColor = color("#fb014d")

local af = Def.ActorFrame{
  InitCommand=function(self)
  end,
}

af[#af+1] = Def.Quad{
  InitCommand=function(self)
    self:diffuse(color("#c73434")):diffusealpha(0.2)
    self:zoomto(SCREEN_WIDTH, SCREEN_HEIGHT)
  end,
}

af[#af+1] = Def.ActorFrame{
  InitCommand=function(self)
    self:y(-SCREEN_CENTER_Y)
  end,
  OnCommand=function(self)
    self:decelerate(0.016 * 40):addx(-240)
  end,

  Def.Sprite{
    Texture=THEME:GetPathG("", "_VisualStyles/SRPG8/Eval/section.png"),
    InitCommand=function(self)
      self:rotationz(70):y(10):diffuse(failColor)
    end,
    OnCommand=function(self)
      self:accelerate(0.1):rotationz(-110):decelerate(0.7):rotationz(-270):accelerate(0.3):rotationz(-280):diffusealpha(0)
    end,
  },

  Def.Sprite{
    Texture=THEME:GetPathG("", "_VisualStyles/SRPG8/Eval/moon.png"),
    InitCommand=function(self)
      self:y(self:GetHeight()/2 * zoomFactor):zoom(zoomFactor)
    end,
  },

  Def.ActorFrame{
    InitCommand=function(self)
      self:y(-15)
    end,

    Def.Sprite{
      Texture=THEME:GetPathG("", "_VisualStyles/SRPG8/Eval/circle.png"),
      InitCommand=function(self)
        self:MaskSource():zoom(0.295)
      end,
    },

    Def.Sprite{
      Texture=THEME:GetPathG("", "_VisualStyles/SRPG8/Eval/circle.png"),
      InitCommand=function(self)
        self:MaskDest():zoom(0.3)
      end,
    },
  },


  Def.ActorFrame{  
    InitCommand=function(self)
      self:y(-15)
    end,

    Def.Sprite{
      Texture=THEME:GetPathG("", "_VisualStyles/SRPG8/Eval/circle.png"),
      InitCommand=function(self)
        self:MaskSource():zoom(0.2):visible(false)
      end,
      OnCommand=function(self)
        self:sleep(0.16):linear(0.16):visible(true):zoom(0.355)
      end,
    },

    Def.Sprite{
      Texture=THEME:GetPathG("", "_VisualStyles/SRPG8/Eval/circle.png"),
      InitCommand=function(self)
        self:MaskDest():zoom(0.2):visible(false)
      end,
      OnCommand=function(self)
        self:sleep(0.16):linear(0.16):visible(true):zoom(0.36)
      end,
    },
  },



  Def.ActorFrame{  
    InitCommand=function(self)
      self:y(-15)
    end,

    Def.Sprite{
      Texture=THEME:GetPathG("", "_VisualStyles/SRPG8/Eval/circle.png"),
      InitCommand=function(self)
        self:MaskSource():zoom(1):visible(false)
      end,
      OnCommand=function(self)
        self:sleep(0.16):linear(0.16):visible(true):zoom(0.99)
      end,
    },

    Def.Sprite{
      Texture=THEME:GetPathG("", "_VisualStyles/SRPG8/Eval/circle.png"),
      InitCommand=function(self)
        self:MaskDest():zoom(0.2):visible(false):diffuse(failColor):diffusealpha(0.2)
      end,
      OnCommand=function(self)
        self:sleep(0.16):linear(0.16):visible(true):zoom(1)
      end,
    },
  },

  Def.Quad{
    InitCommand=function(self)
      self:diffuse(failColor):diffusealpha(0.2):rotationz(15)
      self:zoomto(2, 2000)
    end,
    OnCommand=function(self)
      self:linear(1.4):rotationz(-90)
    end,
  },

  Def.Quad{
    InitCommand=function(self)
      self:diffusealpha(0.2)
      self:zoomto(2, 2000)
    end,
    OnCommand=function(self)
      self:linear(1.4):rotationz(-150)
    end,
  },

  Def.Quad{
    InitCommand=function(self)
      self:zoomto(60, SCREEN_WIDTH):rotationz(90):x(SCREEN_WIDTH/2 + 95):y(30):visible(false)
    end,
    OnCommand=function(self)
      self:sleep(0.4):queuecommand("Show")
    end,
    ShowCommand=function(self)
      self:visible(true)
      self:decelerate(1):zoomto(0, SCREEN_WIDTH):y(15)
    end,
  },

  Def.ActorFrame{  
    InitCommand=function(self)
      self:y(-15)
    end,
    Def.Sprite{
      Name="Mask",
      Texture=THEME:GetPathG("", "_VisualStyles/SRPG8/Eval/circle.png"),
      InitCommand=function(self)
        self:MaskSource():diffuse(color("#ff0000"))
      end,
      OnCommand=function(self)
        self:zoom(0.17):linear(1.2):zoom(3.45)
      end,
    },

    Def.Sprite{
      Texture=THEME:GetPathG("", "_VisualStyles/SRPG8/Eval/circle.png"),
      InitCommand=function(self)
        self:MaskDest()
      end,
      OnCommand=function(self)
        self:visible(true):zoom(0.2):linear(1):zoom(2.9):linear(0.4):diffusealpha(0)
      end,
    },
  },

  Def.ActorFrame{  
    InitCommand=function(self)
      self:x(-30):y(-15)
    end,
    Def.Sprite{
      Name="Mask",
      Texture=THEME:GetPathG("", "_VisualStyles/SRPG8/Eval/circle.png"),
      InitCommand=function(self)
        self:MaskSource():diffuse(color("#ff0000"))
      end,
      OnCommand=function(self)
        self:zoom(0.17):linear(1.2):zoom(3.45)
      end,
    },

    Def.Sprite{
      Texture=THEME:GetPathG("", "_VisualStyles/SRPG8/Eval/circle.png"),
      InitCommand=function(self)
        self:MaskDest()
      end,
      OnCommand=function(self)
        self:visible(true):zoom(0.2):linear(1):zoom(2.9):linear(0.4):diffusealpha(0)
      end,
    },
  },

  Def.ActorFrame{  
    InitCommand=function(self)
      self:x(20):y(-30)
    end,
    Def.Sprite{
      Name="Mask",
      Texture=THEME:GetPathG("", "_VisualStyles/SRPG8/Eval/circle.png"),
      InitCommand=function(self)
        self:MaskSource():diffuse(color("#ff0000"))
      end,
      OnCommand=function(self)
        self:zoom(0.17):linear(1.2):zoom(3.45)
      end,
    },

    Def.Sprite{
      Texture=THEME:GetPathG("", "_VisualStyles/SRPG8/Eval/circle.png"),
      InitCommand=function(self)
        self:MaskDest()
      end,
      OnCommand=function(self)
        self:visible(true):zoom(0.2):linear(1):zoom(2.9):linear(0.4):diffusealpha(0)
      end,
    },
  },



}

-- All the moving triangles
af[#af+1] = Def.ActorFrame{
  InitCommand=function(self)
    self:y(300):x(-200):visible(false)
  end,
  OnCommand=function(self)
    self:sleep(0.2):queuecommand("Move")
  end,
  MoveCommand=function(self)
    self:visible(true):linear(0.7):addy(-400):addx(400):queuecommand("Hide")
  end,
  HideCommand=function(self)
    self:linear(0.1):diffusealpha(0)
  end,
  Def.Sprite{
    Texture=THEME:GetPathG("", "_VisualStyles/SRPG8/Eval/right.png"),
    InitCommand=function(self)
      self:zoom(0.3):rotationz(170):rotationy(180):x(-80)
    end,
  },

  Def.Sprite{
    Texture=THEME:GetPathG("", "_VisualStyles/SRPG8/Eval/iso.png"),
    InitCommand=function(self)
      self:zoom(0.07):rotationz(80):x(-140):y(-80)
    end,
  },

  Def.Sprite{
    Texture=THEME:GetPathG("", "_VisualStyles/SRPG8/Eval/iso.png"),
    InitCommand=function(self)
      self:zoom(0.04):rotationz(120):x(-130):y(-140)
    end,
  },

  Def.Sprite{
    Texture=THEME:GetPathG("", "_VisualStyles/SRPG8/Eval/iso.png"),
    InitCommand=function(self)
      self:zoom(0.2):rotationz(10):x(0):y(-120)
    end,
  },

  Def.Sprite{
    Texture=THEME:GetPathG("", "_VisualStyles/SRPG8/Eval/right.png"),
    InitCommand=function(self)
      self:zoom(0.14):rotationz(-100):rotationy(180):x(70):y(-130)
    end,
  },

  Def.Sprite{
    Texture=THEME:GetPathG("", "_VisualStyles/SRPG8/Eval/iso.png"),
    InitCommand=function(self)
      self:zoom(0.13):rotationz(-10):rotationy(180):x(80):y(-80)
    end,
  },

  Def.Sprite{
    Texture=THEME:GetPathG("", "_VisualStyles/SRPG8/Eval/iso.png"),
    InitCommand=function(self)
      self:zoom(0.2):rotationz(-10):x(200)
    end,
  },

  Def.Sprite{
    Texture=THEME:GetPathG("", "_VisualStyles/SRPG8/Eval/iso.png"),
    InitCommand=function(self)
      self:zoom(0.16):rotationz(-140):x(230):y(-210)
    end,
  },

  Def.Sprite{
    Texture=THEME:GetPathG("", "_VisualStyles/SRPG8/Eval/right.png"),
    InitCommand=function(self)
      self:zoom(0.24):rotationz(10):rotationy(180):x(260):y(-320)
    end,
  },
}

af[#af+1] = Def.ActorFrame{
  InitCommand=function(self)
    self:y(300):x(-300):visible(false)
  end,
  OnCommand=function(self)
    self:sleep(0.2):queuecommand("Move")
  end,
  MoveCommand=function(self)
    self:visible(true):linear(0.7):addy(-500):addx(200):queuecommand("Hide")
  end,
  HideCommand=function(self)
    self:linear(0.1):diffusealpha(0)
  end,
  Def.Sprite{
    Texture=THEME:GetPathG("", "_VisualStyles/SRPG8/Eval/right.png"),
    InitCommand=function(self)
      self:zoom(0.2):rotationz(80):x(-80)
    end,
  },

  Def.Sprite{
    Texture=THEME:GetPathG("", "_VisualStyles/SRPG8/Eval/iso.png"),
    InitCommand=function(self)
      self:zoom(0.1):rotationz(-10):rotationy(180):x(-140):y(-80)
    end,
  },

  Def.Sprite{
    Texture=THEME:GetPathG("", "_VisualStyles/SRPG8/Eval/iso.png"),
    InitCommand=function(self)
      self:zoom(0.04):rotationz(80):x(-130):y(-140)
    end,
  },

  Def.Sprite{
    Texture=THEME:GetPathG("", "_VisualStyles/SRPG8/Eval/iso.png"),
    InitCommand=function(self)
      self:zoom(0.2):rotationz(-110):x(0):y(-120)
    end,
  },

  Def.Sprite{
    Texture=THEME:GetPathG("", "_VisualStyles/SRPG8/Eval/right.png"),
    InitCommand=function(self)
      self:zoom(0.14):rotationz(50):rotationy(180):x(70):y(-130)
    end,
  },

  Def.Sprite{
    Texture=THEME:GetPathG("", "_VisualStyles/SRPG8/Eval/iso.png"),
    InitCommand=function(self)
      self:zoom(0.13):rotationz(10):rotationy(180):x(80):y(-80)
    end,
  },
}

return af