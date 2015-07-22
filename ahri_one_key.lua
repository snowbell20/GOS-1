require("Inspired")
require("IMenu")
require('IWalk')


AddInfo("Ahri", "Ahri")
AddButton("Q", "Use Q", true)
AddButton("W", "Use W", true)
AddButton("E", "Use E", true)
AddButton("R", "R mouse position", true)


OnLoop(function(myHero)
	IWalk()
	DrawMenu()
	DrawText("ONE KEY TO WIN",24,0,0,0xffff0000);
	if GetKeyValue("Combo") then   
	local target = GetCurrentTarget()
	   if ValidTarget(target, 1000) then

		local QPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),2500,250,1000,100,false,false)
			if GetButtonValue("Q") then
                 	if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 then
                 	CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
		end
end
		if GetButtonValue("W") then
		if  CanUseSpell(myHero, _W) == READY and IsInDistance(target, 600) then
                        CastTargetSpell(myHero,_W)
			end
end
		if ValidTarget(target, 1000) then
		local EPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),1550,250,1000,100,true,true)	
			if GetButtonValue("E") then
	        	if CanUseSpell(myHero, _E) == READY and QPred.HitChance == 1 then
                 	CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
		 		end
                	end
end

			if GetButtonValue("R") then
			local mousePos = GetMousePos()
			if CanUseSpell(myHero, _R) == READY then
			   CastSkillShot(_R,mousePos.x,mousePos.y,mousePos.z)
	end
end
	    	end 
	end
end)
