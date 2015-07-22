require("Inspired")
require('IWalk')


AddInfo("Kogmaw", "Kogmaw")
AddButton("Q", "Use Q", true)
AddButton("W", "Use W", true)
AddButton("E", "Use E", true)
AddButton("R", "Use R", true)


OnLoop(function(myHero)
	IWalk()
	DrawMenu()
	DrawText("ONE KEY TO WIN",24,0,0,0xffff0000);
	if GetKeyValue("Combo") then   
	local target = GetCurrentTarget()
		if ValidTarget(target, 1200) then
			local QPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),1650,250,1200,70,true,true)
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

		if ValidTarget(target, 1360) then
			local EPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),1400,250,1360,120,false,true)	
			if GetButtonValue("E") then
	        	if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 then
                 	CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
		 		end
                	end
end
		if ValidTarget(target, 1800) then
			local RPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),math.huge,1200,1800,150,false,false)	
			if GetButtonValue("R") then
	        	if CanUseSpell(myHero, _R) == READY and RPred.HitChance == 1 then
                 	CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
	end
end
end
	    	end 
	end
end)
